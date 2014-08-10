class Classes < ActiveRecord::Migration
  def change
  end
end

class PrivateCluck < ActiveRecord::Base
	belongs_to :user
end

class User < ActiveRecord::Base
	has_many :privateClucks
end
