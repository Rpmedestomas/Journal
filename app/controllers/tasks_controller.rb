class TasksController < ApplicationController

    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.create(params[:task].permit(:title, :description))
        redirect_to category_path(@category)
    end

    def destroy
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category)
    end
end
