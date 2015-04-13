class AddPriceToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :price, :decimal, :precision => 8, :scale => 2 
  end
end
