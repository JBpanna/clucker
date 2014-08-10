class DropTable2 < ActiveRecord::Migration
  def change
  	drop_table :logins
  	drop_table :privateClucks
  end
end

class PrivateCluck < ActiveRecord::Base
	belongs_to :user
end

class User < ActiveRecord::Base
	has_many :private_clucks
end