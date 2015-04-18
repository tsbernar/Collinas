class AddCartIdToCartItems < ActiveRecord::Migration
  def change
  	add_column :cart_items, :cart_id, :integer
    add_index :cart_items, :cart_id
  end
end
