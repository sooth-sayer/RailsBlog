require 'test_helper'

class Post::CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_comment = build("post/comment")

    post :create, post_id: new_comment.post_id, post_comment: new_comment.attributes
    assert_response :redirect

    assert_not_nil Post::Comment.find_by(body: new_comment.body)
  end

  test "#destroy" do
    comment = create("post/comment")

    delete :destroy, post_id: comment.post_id, id: comment.id
    assert_response :redirect

    refute Post::Comment.exists?(comment.id)
  end
end