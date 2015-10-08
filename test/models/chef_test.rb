require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	def setup
      @chef = Chef.new(name: "Sadat Lyazi", email: "user@example.com", password:"")
    end

  test "should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.name = ""
    assert_not @chef.valid?
  end

  test "name should not be too short" do
    @chef.name = "aaaaa"
    assert_not @chef.valid?
  end  

  test "name should not be too long" do
    @chef.name = "a" * 101
    assert_not @chef.valid?
  end  

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should not be too short" do
    @chef.email = "aaaaa" + "@example.com"
    assert_not @chef.valid?
  end

  test "email should not be too long" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end




end
