class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :current_post

  private
  def current_post
    @current_post ||= Post.find(params[:post_id])
  end
end
