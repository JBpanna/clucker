class AddUserIdToPublicImages < ActiveRecord::Migration
  def change
  	add_column :public_images, :user_id, :integer
  end
end
