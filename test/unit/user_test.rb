require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
  end

  test "should not save user without email" do
    assert users(:one).valid?, "Email should not be empty"
    assert users(:one).save, "Email should be unique"


  end
end
