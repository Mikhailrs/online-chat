class RoomsController < ApplicationController
  def create
    @room = current_user&.rooms.build(params.require(:room).permit(:title))

    if @room&.save
      @room.broadcast_append_to :rooms
    end
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @message = current_user&.messages&.build
    @messages = @room.messages
  end

  def index
    @room = Room.new
    @rooms = Room.all
  end
end
