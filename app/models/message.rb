class Message < ApplicationRecord
  belongs_to :task

  after_create :broadcast_message

  private

  def broadcast_message
    broadcast_append_to(
      [ self.task, "messages" ],
      target: "messages-list",
      partial: "messages/item",
      locals: { message: self }
    )
  end
end
