class ProfileController < ApplicationController
    before_action :authenticate_user!
    def index
     @profile = Profile.all()
     @profile = Post.where(user_id:current_user.id) 
     @user = User.find(current_user[:id])
    end   
    def show
      @prof = Post.where(user_id:current_user) 
      @profile = Profile.find(params[:id])
    end 
    def new
        @profile = Profile.new
    end
    def edit
        @profile = Profile.find(params[:id])
    end
    def create
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
      @profile = Post.where(user_id:current_user.id) 
        if @profile.save
          redirect_to @profile
        else
          render 'new'
         end
    end   
    def update
        @profile = Profile.find(params[:id])
       
        if @profile.update(profile_params)
          redirect_to @profile
        else
          render 'edit'
        end
    end


    private
    def profile_params
        params.require(:profile).permit(:uname, :description , :image)
    end 
end
