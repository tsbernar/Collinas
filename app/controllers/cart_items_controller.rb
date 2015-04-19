class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  def add_to_cart
    @cart = current_cart
    @cart.add_item(params[:menu_item_id],@cart)
    redirect_to carts_show_path, notice: 'Added to cart'
  end

  def increase_qty
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.qty += 1 
    @cart_item.save
    redirect_to carts_show_path
  end

  def decrease_qty
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.qty -= 1 
    @cart_item.save
    redirect_to carts_show_path
  end

  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
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
    if @menu_item.add_to_cart
      redirect_to menu_items_path, notice: 'Added to cart'
    else
      redirect_to menu_items_path, notice: 'not added to cart'
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
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
