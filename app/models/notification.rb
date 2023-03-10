class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :broadcast_to_recipient

  def broadcast_to_recipient
    broadcast_prepend_later_to(
      :notifications,
      target: 'notifications-list',
      partial: 'notifications/notification',
      locals: {
        notification: self
      }
    )
  end
end
