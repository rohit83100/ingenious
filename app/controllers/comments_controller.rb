class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id]) 
        @comment = @post.comments.create(comment_params) 
        @comment.user = current_user
        if @post.save
          redirect_to post_path(@post)
         else
          redirect_to post_path(@post)
          flash[:alert] = "not created"
         end
      end
     
      private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
