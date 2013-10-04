require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods

  test "#get posts and comments" do
    comments_count = 7
    posts_count = 25
    posts = create_list(:post_with_comments, posts_count, comments_count: comments_count);

    https!(false)
    get "/posts"
    assert_response :success
    assert_equal posts_count, assigns(:posts).length

    https!(false)
    get "/posts/#{posts.first.id}"
    assert_response :success
    assert_equal comments_count, assigns(:post).comments.length - 1
  end
end
