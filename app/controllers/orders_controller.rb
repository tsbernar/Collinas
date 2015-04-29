class OrdersController < ApplicationController

	def new
		@order = Order.new
		@client_token = Braintree::ClientToken.generate
		@cart = current_cart
		render :layout => 'checkoutlayout'
	end


	def create
		@order = Order.new
		@order.total = current_cart.total.truncate(2).to_s
	  nonce = params[:payment_method_nonce]
	  amount = @order.total
	  render action: :new and return unless nonce
	  result = Braintree::Transaction.sale(
	    amount: amount,
	    payment_method_nonce: nonce	  
	  )

	  flash[:notice] = "Transaction successful!" if result.success?
	  flash[:alert] = "#{result.transaction.processor_response_text}" unless result.success?
	  redirect_to root_path
	end

	def order_info
		@order = Order.new
	end

	def show
		render :layout => 'checkoutlayout'
	end

end
