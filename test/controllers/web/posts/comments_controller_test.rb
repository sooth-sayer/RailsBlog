require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_comment = build("post/comment")

    post :create, post_id: new_comment.post.id, post_comment: new_comment.attributes
    assert_response :redirect

    assert { Post::Comment.find_by(body: new_comment.body) }
  end

  test "#destroy" do
    comment = create("post/comment")

    delete :destroy, post_id: comment.post.id, id: comment.id
    assert_response :redirect

    assert { !Post::Comment.exists?(comment.id) }
  end
end
