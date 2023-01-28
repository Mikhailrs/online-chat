class NotificationsController < ApplicationController
  def index
    @notifications = Notification.order(created_at: :desc)
    .limit(3).where(recipient: User.all)
  end
end
