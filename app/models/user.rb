class User < ActiveRecord::Base

has_many :private_clucks
has_many :public_clucks	
has_many :user_friendships
has_many :friends, through: :user_friendships

validates :user, presence: true,
				uniqueness: true

validates :password, presence: true

validates :name, presence: true

validates :email, presence: true
					
end
