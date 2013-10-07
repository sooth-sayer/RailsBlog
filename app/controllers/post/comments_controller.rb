class Post::CommentsController < ApplicationController
  http_basic_authenticate_with name: "user", password: "user", only: :destroy unless Rails.env.test?

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:post_comment].permit(:commenter, :body))
    flash[:notice] = "Comment was successfully created." if @comment

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
