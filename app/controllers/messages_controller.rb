class MessagesController < ApplicationController
  def create
    @message = current_user&.messages&.build(message_params)

    if @message&.save
      @message.broadcast_append_to @message.room
    end
  end

    private

    def message_params
      params.require(:message).permit(:room_id, :body)
    end
end
