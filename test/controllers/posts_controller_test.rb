require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "shoud get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "index should render correct template and layout" do
    get :index

    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "new_should_render_correct_layout" do
    get :new
    assert_template layout: "layouts/application", partial: "_form"
  end

  test "should create post" do
    assert_difference("Post.count") do
      post :create, post: { title: "Hello!", body: "This is my first post." }
    end

    assert_redirected_to post_path(assigns(:post))
    assert_equal "Post was successfully created.", flash[:notice]
  end
end
