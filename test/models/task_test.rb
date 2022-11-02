require "test_helper"

class TaskTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  
  def setup
    sign_in users(:one)
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "Task Validation (TITLE NOT NULL)" do
    task = @category.tasks.build
    task.deadline = @task.deadline
    
    assert_not task.save, "Error: TASK SAVED WITHOUT TITLE"
  end

  test "Task Validation (DEADLINE NOT NULL)" do
    category = categories(:one)
    task = @category.tasks.build
    task.title = @task.title
    
    assert_not task.save, "Error: TASK SAVED WITHOUT DEADLINE"
  end

  test "Task Validation (CATEGORY_ID & USER ID NOT NULL)" do
    task = Task.new
    task.title = @task.title
    task.body= @task.body
    task.deadline = @task.deadline
    
    assert_not task.save, "Error: TASK SAVED WITHOUT CATEGORY_ID & USER_ID"
  end

end
