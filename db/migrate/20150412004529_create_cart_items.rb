class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    	t.string :name
    	t.string :description
    	t.float :price
    	t.integer :qty
    	t.integer :user_id
      t.timestamps null: false
    end
    add_index :cart_items, :user_id, unique: true
  end
end
