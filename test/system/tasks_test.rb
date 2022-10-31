require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

    include Devise::Test::IntegrationHelpers

    def setup
        sign_in users(:one)
        @category = categories(:one)
        @task = tasks(:one)
    end

    test "Show Task" do
        visit category_task_path(@category,@task)
        assert_selector "span", text: @task.title
    end

    test "Create Task" do
        visit new_category_task_path(@category)
        fill_in "task[title]", with: @task.title
        fill_in "task[body]", with: @task.body
        fill_in "task[deadline]", with: @task.deadline
        click_on "Submit"
        assert_text "Task was successfully added."
    end

    test "Update Task" do
        visit edit_category_task_path(@task,@category)
        fill_in "task[title]", with: @task.title
        fill_in "task[body]", with: @task.body
        fill_in "task[deadline]", with: @task.deadline
        click_on "Submit"
        #assert_text "Task was successfully updated."
    end

    test "Delete Task" do
        visit category_task_path(@task,@category)
        page.accept_confirm do
            click_on "DELETE", match: :first
        end
        assert_text "Task was successfully deleted."
    end

end