require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
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

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    new_post = build(:post)
    post :create, post: new_post.attributes
    assert_response :redirect

    assert_not_nil Post.find_by(title: new_post.title)
    assert_equal "Post was successfully created.", flash[:notice]
  end

  test "#show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, id: @post.id
    assert_response :redirect

    assert !Post.exists?(@post.id)
  end

  test "#edit" do
    get :edit, id: @post.id
    assert_response :success
  end

  test "#update" do
    new_post = attributes_for(:post)
    post :update, id: @post.id, post: new_post
    assert_response :redirect

    @post.reload
    assert_equal new_post[:text], @post.text
  end
end
