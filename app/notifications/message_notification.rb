# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  deliver_by :database

  param :message

  def message
    t(".message")
  end

  def url
    messages_path(params[:message][:room_id], [:message][:body])
  end
end
