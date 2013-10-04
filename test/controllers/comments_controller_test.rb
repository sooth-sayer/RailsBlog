require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "#create" do
    new_comment = build(:comment)

    assert_difference("new_comment.post.comments.count") do
      post :create, post_id: new_comment.post_id, comment: new_comment.attributes
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "#destroy" do
    comment = create(:comment)

    assert_difference("comment.post.comments.count", -1) do
      delete :destroy, post_id: comment.post_id, id: comment.id
    end

    assert_redirected_to post_path(assigns(:post))
  end
end
