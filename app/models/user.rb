class User < ActiveRecord::Base

has_many :private_clucks
has_many :public_clucks, :class_name => "PublicCluck", :foreign_key => 'user_id'
has_many :user_friendships
has_many :friends, through: :user_friendships

validates :user, presence: true,
				uniqueness: true

validates :password, presence: true

validates :name, presence: true

validates :email, presence: true

accepts_nested_attributes_for :public_clucks
accepts_nested_attributes_for :private_clucks
					
end
