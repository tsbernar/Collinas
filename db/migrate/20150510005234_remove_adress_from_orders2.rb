class RemoveAdressFromOrders2 < ActiveRecord::Migration
  def change
  	remove_column :orders, :address, :string
  end
end
