class PostController < ApplicationController
    before_action :authenticate_user!
    def index
        @post = Post.all()
        @user = User.all()
        @profile = Profile.all()
      @profile = Profile.where(user_id: current_user.id)
        # @profile = Profile.find(params[:id])
        @prof = Post.where(user_id:current_user.id) 
    end   
    def show
        @post = Post.find(params[:id])
    end 
    def new
        @post = Post.new
    end    
    def edit
        @post = Post.find(params[:id])
    end
    def create
       
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
          redirect_to @post
        # else
        #   render 'new'
         end
    end   
    def update
        @post = Post.find(params[:id])
       
        if @post.update(post_params)
          redirect_to @post
        else
          render 'edit'
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.user_id = current_user.id
        @post.destroy
        
        redirect_to post_index_path
    end


    private
    def post_params
        params.require(:post).permit(:description , :image, :like)
    end 
end
