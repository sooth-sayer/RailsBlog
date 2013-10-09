class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :current_post

  before_filter do
    add_breadcrumb t(:posts, scope: [:breadcrumbs, :web, :posts]), :posts_path
    add_breadcrumb current_post.title, current_post
  end

  private
  def current_post
    @current_post ||= Post.find(params[:post_id])
  end
end
