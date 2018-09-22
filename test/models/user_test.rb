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
end
