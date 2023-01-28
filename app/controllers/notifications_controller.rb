class NotificationsController < ApplicationController
  def index
    @notifications = Notification.order(id: :desc)
    .limit(3).where(recipient: User.all)
  end
end
