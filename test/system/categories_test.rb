require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    def setup
        sign_in users(:one)
        @category = categories(:one)
    end

    test "View Category" do
        visit categories_url
        assert_selector "span", text: @category.title
    end

    test "Create Category" do
        visit categories_url
        click_on "+"
        fill_in "category[title]", with: @category.title
        click_on "Submit"
        assert_selector "span", text: "NEW CATEGORY"
    end

    test "Update Category" do
        visit categories_url
        click_on "Edit"
        fill_in "category[title]", with: @category.title
        click_on "Submit"
        assert_text "Category was successfully updated."
    end

    test "Delete Category" do
        visit categories_url
        page.accept_confirm do
            click_on "Delete", match: :first
        end
        assert_text "Category was successfully deleted."
    end 

end
