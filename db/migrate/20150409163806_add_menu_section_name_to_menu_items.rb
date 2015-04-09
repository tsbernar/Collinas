class AddMenuSectionNameToMenuItems < ActiveRecord::Migration
  def change
  	add_column :menu_items, :menu_section_id, :integer
  end
end
