class CreatePrivateClucks < ActiveRecord::Migration
  def change
    create_table :private_clucks do |t|

      t.string :private_cluck
      t.string :user
      t.integer :user_id
   

      t.timestamps

    end
  end
end
