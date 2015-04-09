class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.string :name
    	t.string :description
    	t.string :section
      t.integer :menu_section_id
    	t.monetize :price
      t.timestamps null: false
    end
  end
end
