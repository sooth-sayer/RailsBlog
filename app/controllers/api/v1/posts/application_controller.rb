class Api::V1::Posts::ApplicationController < Api::ApplicationController
  helper_method :resource_post

  private
    def resource_post
      @resource_post ||= Post.find(params[:post_id])
    end
end
