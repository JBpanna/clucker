class AddUserIdToPrivateImages < ActiveRecord::Migration
  def change
  	add_column :private_images, :user_id, :integer
  end
end
