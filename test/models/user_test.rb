require 'test_helper'

class UserTest < ActiveSupport::TestCase

  	test "a user should enter a user" do 
  		user = User.new
  		assert !save
  		assert !user.errors[:user].empty?

  	test "a user should enter a password" do 
  		user = User.new
  		assert !save
  		assert !user.errors[:password].empty?

  	test "a user should have a unique profile name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:user].empty?

  	test "a user should enter a name" do 
  		user = User.new
  		assert !save
  		assert !user.errors[:name].empty?

  	test "a user should enter a email" do 
  		user = User.new
  		assert !save
  		assert !user.errors[:email].empty?

  end
end
