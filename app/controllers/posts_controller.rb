class PostsController < ApplicationController
  http_basic_authenticate_with name: "user", password: "user", except: [:index, :show] unless Rails.env.test?

  add_breadcrumb "/", :root_path
  add_breadcrumb :posts, :posts_path

  def index
    @posts = Post.all.page params[:page]
  end

  def new
    add_breadcrumb :new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, @post
    add_breadcrumb :update
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
    add_breadcrumb @post.title, @post
    flash[:notice] = "Show post with id: #{@post.id}"
  end

  private
  def get_post_params
    params.require(:post).permit(:title, :text, :picture)
  end
end
