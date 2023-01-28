class Message < ApplicationRecord
  has_noticed_notifications

  belongs_to :user
  belongs_to :room

  scope :sorted, -> { order(:id) }

  validates :body, presence: true

  after_create_commit :notify_user

  def notify_user
    MessageNotification.with(message: self).deliver_later(user)
  end
end
