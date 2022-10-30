require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase

    include Devise::Test::IntegrationHelpers

    def setup
        sign_in users(:one)
        @task = tasks(:one)
       # @category = categories(:one)
    end

    test "Create a task" do
     
    visit new_category_task_path
        fill_in "task[title]", with: @task.title
        fill_in "task[body]", with: @task.body
        fill_in "task[deadline]", with: @task.deadline
        click_on "Submit"
        assert_text "Task was successfully added."
    end

end