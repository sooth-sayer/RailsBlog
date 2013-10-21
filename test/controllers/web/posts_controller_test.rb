require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create(:post)
  end

  teardown do
    @post = nil
  end

  test "#index" do
    get :index
    assert_response :success
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    new_post = build(:post)
    post :create, post: new_post.attributes
    assert_response :redirect

    created_post = Post.find_by_title(new_post.title)
    assert { created_post }
  end

  test "#show" do
    get :show, id: @post.id
    assert_response :success
  end

  test "#destroy" do
    delete :destroy, id: @post.id
    assert_response :redirect

    assert { !Post.exists?(@post.id) }
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
    assert { @post.text == new_post[:text] }
  end
end
