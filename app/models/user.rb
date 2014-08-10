class User < ActiveRecord::Base

	has_many :privateClucks
	has_many :privateCluck, :through => :privateClucks

end
