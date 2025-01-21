class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def edit
  end

  def update
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
