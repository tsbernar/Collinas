class CreateMenuSections < ActiveRecord::Migration
  def change
  	create_table :menu_sections do |t|
      t.string :name
      t.timestamps 
    end
  end
end
