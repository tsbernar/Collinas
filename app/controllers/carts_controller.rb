class CartsController < ApplicationController
  before_action :current_cart 

  def show
  	@cart = current_cart
  end

	def add_to_cart
		@cart = current_cart
	  @cart.add_item(params[:menu_item_id],@cart)
	  redirect_to carts_show_path, notice: 'Added to cart'
	end

	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
	    @cart = Cart.create
	    session[:cart_id] = @cart.id
	    @cart
	end


end
