class AddMenuItemIdToCartItems < ActiveRecord::Migration
  def change
  	add_column :cart_items, :menu_item_id, :integer
  	add_index :cart_items, :menu_item_id
  end
end
