class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
    	t.string :name, null: false
    	t.string :description, null: false
    	t.decimal :price, :precision => 10, :scale => 2, null: false
    	t.string :section, null: false
      t.timestamps null: false
    end
  end
end
