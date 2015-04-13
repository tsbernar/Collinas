class RemovePriceFromMenuItems < ActiveRecord::Migration
  def change
    remove_column :menu_items, :price, :float
  end
end
