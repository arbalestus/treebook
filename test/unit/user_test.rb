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

  	test "a user should enter a unique profile name" do
		user = User.new
		user.profile_name = users(:daniel).profile_name
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should enter a profile name formatted correctly" do
		user = User.new
		user.profile_name = 'Profile name full of spaces'
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly")
	end
end
