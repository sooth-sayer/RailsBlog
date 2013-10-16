class Api::V1::Posts::CommentsController < Api::V1::Posts::ApplicationController
  def create
    comment = resource_post.comments.build(comment_params)
    comment.save
    # debugger
    # respond_with(comment, :location => nil, :status => :created)
    render nothing: true, status: :created
  end

  private
    def comment_params
      params[:post_comment].permit(:body, :parent_id, :commenter_id)
    end
end
