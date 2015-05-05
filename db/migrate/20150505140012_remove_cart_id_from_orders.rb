class RemoveCartIdFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :cart_id, :string
  end
end
