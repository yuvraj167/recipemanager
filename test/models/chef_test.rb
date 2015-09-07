require 'test_helper'

class ChefTest < ActiveSupport::TestCase

def setup 
	@chef = Chef.new(chefname: "yuvi",email: "yuvraj.167@gmail.com")
end

test "chef should be valid " do 
	assert @chef.valid?
end

test "chefname should be present" do
	@chef.chefname =" "
	assert_not @chef.valid?
end
	
	test "chefname should not be too long" do
		@chef.chefname = "a"*101
		assert_not @chef.valid?
	end

	test "chefname should not be too short" do
		@chef.chefname ="aa"
		assert_not @chef.valid?
	end

	test "email should be present" do
		@chef.email =" "
		assert_not @chef.valid?
	end

	test "email length should be within bounds" do
		@chef.email = "a"*101 + "@example.com"
		assert_not @chef.valid?
	end

	test "email address should be unique" do
		dup_chef = @chef.dup
		dup_chef.email = @chef.email.upcase
		@chef.save
		assert_not dup_chef.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses =%w[yuiv@ee.com yuvi@ee.org ecam@eaxma.com ab+cd@ee.com]
		valid_addresses.each do |i| 
			@chef.email = i
			assert @chef.valid?,"#{i.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[yuv.eas,com sdsd,vom]
		invalid_addresses.each do |i|
			@chef.email = i
			assert_not @chef.valid?, "#{i.inspect} should be invalid"
		end 
	end

end