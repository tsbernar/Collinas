class CreateMenuItems < ActiveRecord::Migration
  def change
  	drop_table :menu_items
    create_table :menu_items do |t|
    	t.string :name, null: false
    	t.string :description, null: false
    	t.string :section, null: false
      t.integer :menu_section_id
    	t.monetize :price
      t.timestamps null: false
    end
  end
end
