class OrdersController < ApplicationController

	def new
		@client_token = Braintree::ClientToken.generate
	end


	def create
	  nonce = params[:payment_method_nonce]
	  render action: :new and return unless nonce
	  result = Braintree::Transaction.sale(
	    amount: "10.00",
	    payment_method_nonce: nonce
	  )

	  flash[:notice] = "Transaction successful!" if result.success?
	  flash[:alert] = "#{result.transaction.processor_response_text}" unless result.success?
	  redirect_to action: :new
	end


end
