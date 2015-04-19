class CartItem < ActiveRecord::Base
	belongs_to :cart

	def add_to_cart
		@cart = current_cart
	  current_cart.add_item(params[:menu_item_id])
	  redirect_to carts_show_path, notice: 'Added to cart'
	end

	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
	    cart = Cart.create
	    session[:cart_id] = cart.id
	    cart
	end
end
