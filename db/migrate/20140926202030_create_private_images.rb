class CreatePrivateImages < ActiveRecord::Migration
  def change
    create_table :private_images do |t|
      t.string :privateImageName
      t.binary :privateImagePic

      t.timestamps
    end
  end
end
