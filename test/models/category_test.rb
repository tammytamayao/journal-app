require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @current_user = users(:one)
    sign_in @current_user
    @category = categories(:one)
  end

  test "Category Validation (TITLE NOT NULL)" do
    category = @current_user.categories.build(title:nil)
    assert_not category.save, "CATEGORY SAVED WITHOUT NO TITLE"
  end

  test "Category Validation (USER_ID NOT NULL)" do
    category = Category.new
    category.title = @category.title
    assert_not category.save, "CATEGORY CREATED WITHOUT USER_ID"
  end

end
