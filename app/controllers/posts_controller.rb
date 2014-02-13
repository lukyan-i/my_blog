class PostsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @post = Post.new

  end
  def show
    @post = current_user.posts.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to @post
      else
        render 'new'
      end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
private
  def post_params
    params.require(:post).permit(:title, :text)
  end


end
