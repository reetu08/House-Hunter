require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "User One is an Admin" do
    user = User.find_by_email 'one@something.org'
    assert user.admin?
  end

  test "User One is a House Hunter" do
    user = User.find_by_email 'one@something.org'
    assert user.househunter?
  end

  test "User Two is not an Admin" do
    user = User.find_by_email 'two@something.org'
    assert_not user.admin?
  end

  test "New User valid" do
    user = User.new
    user.name = "Dan"
    user.phone = "9191234567"
    user.email = "something@something.com"
    user.password = "password"
    user.preferred_contact = User.preferred_contact_types[1]
    assert user.valid?
  end
end
