class CreatePublicClucks < ActiveRecord::Migration
  def change
    create_table :public_clucks do |t|

      t.string :public_cluck
      t.string :user
      t.integer :user_id

      t.timestamps
    end
  end
end
