class RemovePriceFromCartItems < ActiveRecord::Migration
  def change
  	remove_column :cart_items, :price, :float
  end
end
