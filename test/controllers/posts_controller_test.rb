require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:one)
  end

  def teardown
    @post = nil
  end

  test "#index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "#index template and layout" do
    get :index

    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "#new layout" do
    get :new

    assert_template layout: "layouts/application", partial: "_form"
  end

  test "#create" do
    assert_difference("Post.count") do
      post :create, post: { title: "Hello!", body: "This is my first post." }
    end

    assert_redirected_to post_path(assigns(:post))
    assert_equal "Post was successfully created.", flash[:notice]
  end

  test "#show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "#destroy" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.id
    end

    assert_redirected_to posts_path
  end

  test "routes" do
    assert_routing "/posts/1", controller: "posts", action: "show", id: "1"
  end
end
