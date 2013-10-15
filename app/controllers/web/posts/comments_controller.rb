class Web::Posts::CommentsController < Web::Posts::ApplicationController
  http_basic_authenticate_with name: configus.user.name, password: configus.user.password, :only => :destroy unless Rails.env.test?

  def create
    @post = resource_post
    @comment = @post.comments.create(comment_params)
    f(:success) if @comment

    redirect_to post_path(@post)
  end

  def destroy
    @post = resource_post
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      f(:success)
    end
    redirect_to post_path(@post)
  end

  def comment_params
    params[:post_comment].permit(:body, :parent_id, :commenter_id)
  end
end
