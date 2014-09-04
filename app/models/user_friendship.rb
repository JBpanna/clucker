class UserFriendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

	attr_accessible :user, :friend, :user_id, :friend_id
	validates :user_id, presence: true
	validates :friend_id, presence: true
end
