class ColumnRemove < ActiveRecord::Migration
  def change
  	remove_column :private_clucks, :user
  	remove_column :public_clucks, :user
  end
end
