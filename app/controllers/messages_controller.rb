class MessagesController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @task.messages.create(message_params)
    render json: {}, status: :no_content
  end

  private

  def message_params
    params.require(:message).permit(:value)
  end
end
