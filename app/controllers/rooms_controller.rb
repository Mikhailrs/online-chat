class RoomsController < ApplicationController
  def create
    @room = current_user&.rooms.build(params.require(:room).permit(:title))

    if @room&.save
      @room.broadcast_append_to :rooms
    end
  end

  def index
    @room = Room.new
    @rooms = Room.all
  end
end
