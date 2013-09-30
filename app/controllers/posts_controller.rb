class PostsController < ApplicationController
  http_basic_authenticate_with name: "user", password: "user", except: [:index, :show] unless Rails.env.test?

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(get_post_params)
    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to @post
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(get_post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    flash[:notice] = "Show post with id: #{@post.id}"
  end

  private
  def get_post_params
    params.require(:post).permit(:title, :text)
  end
end
