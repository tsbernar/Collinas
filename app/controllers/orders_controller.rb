class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :update]

	def index
		@orders = Order.all
	end

	def new
		@order = Order.new
		@client_token = Braintree::ClientToken.generate
		@cart = current_cart
		render :layout => 'checkoutlayout'
	end

	def update
			if @order.update_attributes(order_params)
				sync_update @order
				redirect_to orders_path, notice: "Order was successfully updated."
			else
				redirect_to orders_path
			end
	end


	def create
		@order = Order.new
		@order.total = current_cart.total.truncate(2).to_s
		@order.cart_id = current_cart.id
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
	  end
	end

	def order_info
		@order = Order.new
		render :layout => 'checkoutlayout'
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

		def set_order
      @order = Order.find(params[:id])
    end

		def order_params
      params.require(:order).permit(:id, :total, :tax, :subtotal, :cart_id, :name, :delivery?, :phone_number, :address, :zip)
    end

end
