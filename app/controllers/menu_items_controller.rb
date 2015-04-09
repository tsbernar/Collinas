class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
  end

  def show
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to @menu_item, notice: 'Menu item was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      fredirect_to @menu_item, notice: 'Menu item was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @menu_item.destroy
      redirect_to menu_items_url, notice: 'Menu item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params[:menu_item]
    end
end
