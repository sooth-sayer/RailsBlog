class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :current_post

  before_filter do
    add_breadcrumb :posts, :posts_path
    add_breadcrumb resource_post.title, resource_post
  end

  private
  def resource_post
    @current_post ||= Post.find(params[:post_id])
  end
end
