require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  fixtures :posts, :comments

  test "#get posts and comments" do
    https!(false)
    get "/posts"
    assert_response :success
    assert assigns(:posts)

    https!(false)
    get "/posts/#{posts(:one).id}"
    assert_response :success
    assert_equal 1, assigns(:post).comments.length
  end
end
