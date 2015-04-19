class AddDefaultValueToQtyAttributeOfCartItems < ActiveRecord::Migration
  def change
  	 change_column :cart_items, :qty, :integer, :default => 0
  end
end
