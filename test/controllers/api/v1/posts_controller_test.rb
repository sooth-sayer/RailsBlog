require "test_helper"

class Api::V1::PostsControllerTest < ActionController::TestCase
  setup do
    @post = create(:post)
  end

  test "#index" do
    get :index, :format => :json
    assert_response :success
  end

  test "#show" do
    get :show, id: @post.id, :format => :json
    assert_response :success
  end
end
