class PostController < ApplicationController
    before_action :authenticate_user!
    def index
        @post = Post.all().order(created_at: :desc)
        @user = User.all()
        @profile = Profile.all()
        @profile = Profile.where(user_id: current_user.id).first
        @prof = Profile.where(user_id: current_user.id).first
       
  end
  def profile_image
    if current_user
    Profile.where(post_id: Post.ids)
    end
  end  

    def upvote
      @post = Post.find(params[:id])
     @prop = current_user.get_up_voted(Post)
      respond_to do |format|
      if current_user.voted_up_on? @post
        @post.unvote_by current_user
      else
        @post.upvote_by current_user
      end
      
        format.js { render :file => "C:/Users/Lenovo/Desktop/bay/ingenious_bay/app/views/post/vote.js.erb" }
        format.html 
      end
    end
  
    def downvote
      @post = Post.find(params[:id])
      respond_to do |format|
      if current_user.voted_down_on? @post
        @post.unvote_by current_user
      else
        @post.downvote_by current_user
      end
      format.js { render :file => "C:/Users/Lenovo/Desktop/bay/ingenious_bay/app/views/post/vote.js.erb" }
        format.html 
    end
  end
  

    def show
        @post = Post.find(params[:id])
        @profile = Profile.all()
        @profile = Profile.where(user_id: current_user.id).first
        @prof = Profile.where(user_id: current_user.id).first
    end 
    def new
        @post = Post.new
        @prof = Profile.where(user_id: current_user.id).first
        @profile = Profile.where(user_id: current_user.id).first
    end    
    def edit
        @post = Post.find(params[:id])
        @prof = Profile.where(user_id: current_user.id).first
        @profile = Profile.where(user_id: current_user.id).first
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
