class CartsController < ApplicationController
  before_action :current_cart 

  def show
  	@cart = current_cart
  end

	def add_to_cart
		@cart = current_cart
	  @cart.add_item(params[:menu_item_id])
	  redirect_to menu_items_path, notice: "Added to cart"
	end

end
