class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy, :add]
  before_action :set_sections_for_upload_template, only: :upload

  def upload
    respond_to do |format|
      format.html
      format.csv { send_data @sections.to_csv_template}
    end
  end

  def import
    count = MenuItem.import params[:file]
    redirect_to menu_items_path, notice: "Imported #{count} items"
  end
  
  def index
    @menu_items = MenuItem.all
    @menu_sections = MenuSection.all
    @user = current_user
    @cart = current_cart
    respond_to do |format|
      format.html
      format.csv { send_data @menu_items.to_csv }
    end
  end

  def new
    @menu_item = MenuItem.new
  end

  def show
  end

  def edit
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to menu_items_path, notice: 'Menu item was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_items_path, notice: 'Menu item was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @menu_item.destroy
      redirect_to menu_items_url, notice: 'Menu item was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def set_sections_for_upload_template
      @sections = MenuSection.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    
    def menu_item_params
      params.require(:menu_item).permit(:id, :name, :description, :price, :section, :menu_section_id)
    end
end
