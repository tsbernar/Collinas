class CreateMenuItems < ActiveRecord::Migration
  def change
  	create_table :menu_items do |t|
      t.string :name
    	t.string :description
    	t.string :section
      t.integer :menu_section_id
    	t.float :price
      t.timestamps null: false
  	end
	end
end
