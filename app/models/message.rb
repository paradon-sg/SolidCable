class Message < ApplicationRecord
  belongs_to :task

  after_create :broadcast_message

  private

  def broadcast_message
    broadcast_append_to(
      [ self.task, "message" ],
      target: "messages-list",
      partial: "messages/message",
      locals: { message: self }
    )
  end
end
