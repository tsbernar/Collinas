class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  def increase_qty
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.qty += 1 
    @cart_item.save
    redirect_to cart_path
  end

  def decrease_qty
    @cart_item = CartItem.find(params[:cart_item_id])
    if @cart_item.qty > 1
      @cart_item.qty -= 1 
      @cart_item.save
      redirect_to cart_path
    else
      @cart_item.destroy
      redirect_to cart_path
    end
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params[:cart_item]
    end
end
