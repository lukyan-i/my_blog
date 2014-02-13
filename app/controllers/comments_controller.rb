class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = Comment.create(comment_params.merge(:user => current_user, :post => @post))

    redirect_to post_path(@post)
  end

  def destroy
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end