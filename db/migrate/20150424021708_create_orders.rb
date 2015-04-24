class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :cart_id
    	t.string :name
    	t.boolean :delivery?
    	t.string :phone_number
    	t.string :address
    	t.string :zip
    	t.decimal :total, precision: 8, scale: 2
    	t.decimal :subtotal, precision: 8, scale: 2
    	t.decimal :tax, precision: 8, scale: 2
      t.timestamps null: false
    end
  end
end
