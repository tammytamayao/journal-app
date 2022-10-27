class TasksController < ApplicationController

    before_action :set_category, only: [:show, :new, :create, :edit, :update, :destroy]
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = current_user.tasks
        @datetoday = Date.current
        @overdue = current_user.tasks.where('deadline < ?', @datetoday)
        @today = current_user.tasks.where('deadline = ?', @datetoday)
        @soon = current_user.tasks.where('deadline > ?', @datetoday)
    end

    def show
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to category_task_path(@category,@task), notice: "Task was successfully added."
        else
          render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to @category, notice: "Task was successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to category_path(@category), notice: "Task was successfully deleted."
    end
    
    private

    def set_category
        @category = current_user.categories.find(params[:category_id])
    end

    def set_task
        @task = @category.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :body, :deadline, :completed)
    end

end
