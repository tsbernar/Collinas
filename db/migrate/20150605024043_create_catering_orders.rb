class CreateCateringOrders < ActiveRecord::Migration
  def change
    create_table :catering_orders do |t|
    	t.string :name
    	t.string :phone
    	t.string :email
    	t.string :address
    	t.string :start
      t.string :end
      t.string :booking_id
    	t.decimal :total ,          precision: 8, scale: 2
    	t.decimal :subtotal,       precision: 8, scale: 2
    	t.decimal :tax,            precision: 8, scale: 2
      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
