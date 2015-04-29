class AddCompletedToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :completed, :boolean
  end
end
