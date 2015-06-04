class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.string :description
    	t.string :start
      t.string :end
      t.string :order_id
    	t.float :price
      t.timestamps null: false
    end
  end
end
