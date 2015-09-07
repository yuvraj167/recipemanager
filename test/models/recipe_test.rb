require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup 
		@chef = Chef.create(chefname: 'yuvraj',email: 'yuvraj@example.com')
		@recipe = @chef.recipes.build(name: "ChickenSandwich", summary: "Tasty,Spicy,Sexy", description: "Delicious,Tender n yummy,Well Served")
	end
 
	test "recipe should be valid" do 
		assert @recipe.valid?
	end

	test "chef_id should be present" do 
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end

	test "name should be present" do 
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "name length should not be too long" do 
		@recipe.name = "a"*101
		assert_not @recipe.valid?
	end

	test "name length should not be too short" do 
		@recipe.name = "aaa"
		assert_not @recipe.valid?
	end

	test "summary should be present" do 
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "summary length should not be too long" do 
		@recipe.summary = "a" * 151
		assert_not @recipe.valid?
	end

	test "summary length should not be too short" do 
		@recipe.summary ="aaaa"
		assert_not @recipe.valid?, "#{@recipe.summary.length.inspect} is the error"
	end

	test "description must be present" do 
		@recipe.description =" "
		assert_not @recipe.valid?
	end

	test "description length should not be too long" do 
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end

	test "description length should not be too short" do 
		@recipe.description ="aaa"
		assert_not @recipe.valid?
	end
		
end