class CreateUsers < ActiveRecord::Migration
  def change
  
    create_table :users do |t|
      t.string :user
      t.string :password
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
