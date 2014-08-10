class User < ActiveRecord::Base

has_many :private_clucks
has_many :public_clucks	

end
