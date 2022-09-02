class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @users = User.all_except(current_user)

        @room = Room.new
        @rooms = Room.public_rooms
        @room_name = get_name(@user, current_user)
        @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

        @message= Message.new
        @messages = @single_room.messages.order(created_at: :asc)
        render 'rooms/index'
    end

    private
    def get_name(user1, user2)
        if user1.id < user2.id 
            return "#{user1.id}-#{user2.id}"
        else 
            return "#{user2.id}-#{user1.id}"
        end           
        # user = [user1, user2].sort
    #    (user1.id) || (user2.id)
    #    "private_#(user1.id_#user2.id)"
    end    
end
