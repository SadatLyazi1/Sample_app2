require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	def setup
      @chef = Chef.new(name: "Sadat Lyazi", email: "user@example.com", password:"password")
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


  test "email should not be too long" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup

    dup_chef.email= @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[sadat@gmail.com lyazi+sadat@gmail.co.ug first.last@wae.ug]
    
     valid_addresses.each do |va|
     @chef.email =va
     assert_not @chef.valid?, "#{va.inspect} should be a valid addresses"

     end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[sadat.gmail.com lyazi+sadat@gmail@co.ug first@last@wae.ug]
     
     invalid_addresses.each do |ia|
     @chef.email =ia
    assert_not @chef.valid?, "#{ia.inspect} should be a invalid addresses"
     end
  end



end
