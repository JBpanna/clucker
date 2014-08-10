class CluckEditId < ActiveRecord::Migration
  def change
  	add_column :privateClucks, :user_id, :integer
  end
end
