require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	test "a user should enter a first name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:first_name].empty?
  	end
  	test "a user should enter a last name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:last_name].empty?
  	end
  	test "a user should enter a profile name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  	end
  	test "a user should have a unique profile name" do
  		user = User.new
  		user.profile_name = users(:rato).profile_name

  		users(:rato)
  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  	end

  	test "a user should have a profile name wo spaces" do
  		user= User.new
  		user.profile_name="My Profile With Spaces"

  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  		assert user.errors[:profile_name].include?("must be formatted correctly.")
  	end
  	test "a user should have a correctly formatted profile name" do
  		user = User.new(first_name: 'ra', last_name: 'to', email: 'abc1@cba.ss')
  		user.password = user.password_confirmation = 'asdfasdf'

  		user.profile_name= 'abcd_efgh'
  		assert user.valid?
  	end
end
