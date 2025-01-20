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
    @messages = @task.messages
  end
end
