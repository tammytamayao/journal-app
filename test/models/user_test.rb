require "test_helper"

class UserTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  test "USER SIGNUP/LOGIN INFO (NOT NULL)" do
    user = users(:empty)

    assert user.save, "Error: EMAIL OR PASSWORD IS BLANK"
  end

end
