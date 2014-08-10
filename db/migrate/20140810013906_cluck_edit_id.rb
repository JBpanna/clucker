class CluckEditId < ActiveRecord::Migration
  def change
  	add_column :private_clucks, :user_id, :integer
  	add_column :private_clucks, :user, :integer
  	add_column :private_clucks, :user, :string
  end
end
