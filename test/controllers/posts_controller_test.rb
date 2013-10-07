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

    created_post = Post.find_by(title: new_post.title)
    assert_not_nil created_post

    assert_redirected_to post_path(created_post)
    assert_equal "Post was successfully created.", flash[:notice]
  end

  test "#show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, id: @post.id

    refute Post.exists?(@post.id)

    assert_redirected_to posts_path
  end

  test "routes" do
    assert_routing "/posts/1", controller: "posts", action: "show", id: "1"
  end
end
