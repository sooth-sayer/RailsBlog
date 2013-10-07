require 'test_helper'

class Post::CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_comment = build("post/comment")
    post :create, post_id: new_comment.post_id, post_comment: new_comment.attributes

    created_comment = Post::Comment.find_by(body: new_comment.body)
    assert_not_nil created_comment
    assert_redirected_to post_path(new_comment.post)
  end

  test "#destroy" do
    comment = create("post/comment")
    delete :destroy, post_id: comment.post_id, id: comment.id

    refute Post::Comment.exists?(comment.id)
    assert_redirected_to post_path(comment.post)
  end
end
