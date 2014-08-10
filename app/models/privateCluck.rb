class PrivateCluck < ActiveRecord::Base

	belongs_to :user
	def self.find_privateClucks_with_user(user_id)
end
