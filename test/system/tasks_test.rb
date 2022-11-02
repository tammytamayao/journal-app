require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
      sign_in users(:one)
      @category = categories(:one)
      @task = tasks(:one)
  end

  test "Show Task" do
      visit tasks_url(@task)
      assert_selector "span", text: "ALL TASKS"
  end

  test "Create Task" do
      visit categories_url(@category)
      click_on @category.title, match: :first
      click_on "ADD"
      fill_in "task[title]", with: @task.title
      fill_in "task[body]", with: @task.body
      fill_in "task[deadline]", with: @task.deadline
      click_on "Submit"
      assert_text "Task was successfully added."
  end

  test "Update Task" do
      visit categories_url(@category)
      click_on @category.title, match: :first
      click_on @task.title, match: :first
      click_on "EDIT"
      fill_in "task[title]", with: @task.title
      fill_in "task[body]", with: @task.body
      fill_in "task[deadline]", with: @task.deadline
      click_on "Submit"
      assert_selector "span", text: "EDIT TASK"
  end

  test "Delete Task" do
      visit categories_url(@category)
      click_on @category.title, match: :first
      click_on @task.title, match: :first
      page.accept_confirm do
          click_on "DELETE"
      end
      assert_text "Task was successfully deleted."
  end
end
