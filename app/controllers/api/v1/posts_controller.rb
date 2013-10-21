class Api::V1::PostsController < Api::ApplicationController
  def index
    @posts = Post.published.ransack(params[:q])
    @posts = @posts.result(distinct: true)
    @posts = @posts.page params[:page]

    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])

    respond_with @post
  end
end
