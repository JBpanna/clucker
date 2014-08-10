class CreatePrivateClucks < ActiveRecord::Migration
  def change
    create_table :private_clucks do |t|
      t.string :privateCluck

      t.timestamps
    end
  end
end
