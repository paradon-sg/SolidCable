class Task < ApplicationRecord
  has_many :messages, dependent: :destroy

  after_create :broadcast_task

  private

  def broadcast_task
    broadcast_append_to(
      "task",
      target: "tasks-list",
      partial: "tasks/task",
      locals: { task: self }
    )
  end
end
