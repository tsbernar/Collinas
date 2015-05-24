class AddInprogressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :in_progress, :boolean, default: false, null: false
  end
end
