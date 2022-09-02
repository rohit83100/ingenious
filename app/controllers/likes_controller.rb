class LikesController < ApplicationController
def index
   
end
def create 
    @like = current_user.likes.new(like_params)
    post = Post.find(@like.post_id)
    if !@like.save
        flash[:notice] = @like.errors.full_messages.to_sentence 
    end
    redirect_back_or_to 'post'
end 
def destroy
    @like = current_user.likes.find(params[:id])
    post = Post.find(@like.post_id) 
    @like.destroy
    redirect_back_or_to 'post'
end

private 

def like_params
    params.require(:like).permit(:post_id)
end
end