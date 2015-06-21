class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :update]
	before_action :require_admin, only: [:index]

	def index
		@orders = Order.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
	end

	def new #order_info 
		@order = Order.new
		@cart = current_cart
		render :layout => 'blanklayout'
	end

	def create
	 @order = Order.new(order_params)
	 @order.total = current_cart.total.truncate(2).to_s
	 @order.cart_id = current_cart.id
    if @order.save
    	session[:order] = @order.id 
      redirect_to checkout_path
    else
      render :new 
    end
	end

	def checkout #braintree
		@client_token = Braintree::ClientToken.generate
		@cart = current_cart
		render :layout => 'blanklayout'
	end

	def update
		if @order.update_attributes(order_params)
			sync_update @order
			format.html {redirect_to [orders_path]}
			format.js
		else
			format.html {redirect_to [orders_path]}
			format.js
		end
	end

	def braintree
		@order = Order.find(session[:order])
		@cart = current_cart
		nonce = params[:payment_method_nonce]
	  amount = @order.total
	  render action: :new and return unless nonce
	  result = Braintree::Transaction.sale(
	    amount: amount,
	    payment_method_nonce: nonce	  
	  )
	  @order.save
	  flash[:notice] = "Transaction successful!" if result.success?
	  flash[:alert] = "#{result.transaction.processor_response_text}" unless result.success?
	  if result.success?
	  	cart = current_cart
	  	cart.completed = true
	  	cart.save
	  	cart = Cart.create
	    session[:cart_id] = cart.id
	    sync_new @order
	  	redirect_to @order
	  	@order.send_notification
	  end
	end

	def show
		respond_to do |format|
			format.html
			format.json
			format.pdf { 
				send_data(@order.receipt.render, 
									filename: "#{@order.created_at.strftime('%Y-%m-%d')}-order-#{@order.id}-receipt.pdf" ,
									type: "application/pdf",
									disposition: :inline
									)
			}
		end
	end

	private

		def require_admin
			if !current_user.try(:admin?)
				redirect_to root_path
			end
		end

		def set_order
      @order = Order.find(params[:id])
    end

		def order_params
      params.require(:order).permit(:id, :total, :tax, :subtotal, :cart_id, :name, :delivery?, :phone_number, :address, :zip, :completed, :in_progress, :email)
    end

end
