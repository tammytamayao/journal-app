require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup do
    sign_in users(:one)
    @category = categories(:one)
  end

end
