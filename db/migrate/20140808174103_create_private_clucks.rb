class CreatePrivateClucks < ActiveRecord::Migration
  def change
    create_table :privateClucks do |t|
      t.string :privateCluck

      t.timestamps
    end
  end
end
