require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  test "#get posts and comments" do
    comments_count = 1
    posts_count = 2
    posts = create_list(:post, posts_count, comments_count: comments_count);

    https!(false)
    get "/posts"
    assert_response :success

    https!(false)
    get "/posts/#{posts.first.id}"
    assert_response :success
  end
end
