class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :resource_post

  before_filter do
    add_breadcrumb :posts, :posts_path
    add_breadcrumb resource_post.title, resource_post
  end

  private
  def resource_post
    @resource_post ||= Post.find(params[:post_id])
  end
end
