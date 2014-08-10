class CreatePrivateClucks < ActiveRecord::Migration
  def change
    create_table :private_clucks do |t|

      t.timestamps
    end
  end
end
