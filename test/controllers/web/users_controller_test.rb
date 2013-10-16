require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create(:user)
    @new_user = attributes_for(:user)
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
    post :create, user: @new_user
    assert_response :redirect

    assert { @new_user[:email] == User.find_by_name(@new_user[:name]).email }
  end

  test "#show" do
    get :show, id: @user
    assert_response :success
  end

  test "#edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "#update" do
    patch :update, id: @user, user: @new_user
    assert_response :redirect

    @user.reload
    assert  { @new_user[:email] == @user.email }
  end

  test "#destroy" do
    delete :destroy, id: @user
    assert_response :redirect

    assert { !User.exists?(@user) }
  end
end
