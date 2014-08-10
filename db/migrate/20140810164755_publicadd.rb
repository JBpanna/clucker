class Publicadd < ActiveRecord::Migration
  def change
  end
end

class PublicCluck < ActiveRecord::Base
	belongs_to :user
end

class User < ActiveRecord::Base
	has_many :public_clucks
end