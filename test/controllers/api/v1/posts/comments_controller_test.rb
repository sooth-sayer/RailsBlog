require 'test_helper'

class Api::V1::Posts::CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_comment = build("post/comment")

    post :create, post_id: new_comment.post.id, post_comment: new_comment.attributes, :format => :json
    assert_response :created

    assert_not_nil Post::Comment.find_by_body(new_comment.body)
  end
end
