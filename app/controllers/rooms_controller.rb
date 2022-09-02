class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
     @room = Room.new
     @rooms = Room.public_rooms
     @user = User.all_except(current_user)
     @prof = Profile.where(user_id: current_user.id).first
     @profile = Profile.where(user_id: current_user.id).first
  end

  def show
    @single_room = Room.find(params[:id])
    @room = Room.new
    @rooms = Room.public_rooms


    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @user = User.all_except(current_user)
    render 'index'
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    redirect_back_or_to 'rooms'
end
  
end
