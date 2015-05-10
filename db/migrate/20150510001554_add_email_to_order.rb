class AddEmailToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string, default: "",    null: false
  end
end
