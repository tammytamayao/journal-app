require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
    @category = categories(:one)
  end

  test "Category Validation (TITLE NOT NULL)" do
    category = Category.new
    assert_not category.save, "Error: SAVED WITHOUT NO TITLE"
  end

  test "Category Validation (USER_ID NOT NULL)" do
    category = Category.new
    category.title = @category.title
    assert_not category.save, "Error: CREATED WITHOUT USER_ID"
  end

end
