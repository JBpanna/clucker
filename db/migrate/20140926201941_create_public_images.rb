class CreatePublicImages < ActiveRecord::Migration
  def change
    create_table :public_images do |t|
      t.string :publicImageName
      t.binary :publicImagePic

      t.timestamps
    end
  end
end
