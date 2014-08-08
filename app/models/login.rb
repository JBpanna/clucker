class Login < ActiveRecord::Base
	 validates :login, presence: true
end
