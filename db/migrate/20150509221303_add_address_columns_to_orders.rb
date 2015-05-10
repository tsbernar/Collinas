class AddAddressColumnsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :address_number, :string
  	add_column :orders, :city, :string
  	add_column :orders, :street, :string
  end
end
