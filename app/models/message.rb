class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :sorted, -> { order(:id) }

  validates presence: true
end
