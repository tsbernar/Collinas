class AddDefaultValueToCompletedAttributeOfCarts < ActiveRecord::Migration
  def change
  change_column :carts, :completed, :boolean, :default => false
  end
end
