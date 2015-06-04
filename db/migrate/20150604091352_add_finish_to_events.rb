class AddFinishToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :finish, :sting
  end
end
