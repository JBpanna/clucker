class Cluckedit < ActiveRecord::Migration
  def change
  	rename_table :private_clucks, :privateClucks
  end
end
