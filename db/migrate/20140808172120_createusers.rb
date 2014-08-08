class Createusers_old < ActiveRecord::Migration
  
  	def change
    create_table :users_old do |t|
 

      t.timestamps
    end
  end


end
