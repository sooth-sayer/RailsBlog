require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = create(:post)
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
    new_post = build(:post)
    post :create, post: new_post.attributes

    assert_not_nil Post.find_by(title: new_post.title)

    assert_response :redirect
    assert_equal "Post was successfully created.", flash[:notice]
  end

  test "#show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, id: @post.id

    refute Post.exists?(@post.id)

    assert_response :redirect
  end

  test "#edit" do
    get :edit, id: @post.id

    assert_response :success
  end

  test "#update" do
    new_post = attributes_for(:post)
    post :update, id: @post.id, post: new_post

    updated_post = Post.find(@post.id)

    assert_equal new_post[:text], updated_post.text

    assert_response :redirect
  end

  test "routes" do
    assert_routing "/posts/1", controller: "posts", action: "show", id: "1"
  end
end
