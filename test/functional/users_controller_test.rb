require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new, {}, {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, 
                            name: @user.name, 
                            nickname: @user.nickname, 
                            shares_remaining: @user.shares_remaining, 
                            login: "fred",
                            password: "secret",
                            password_confirmation: "secret" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @user},
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update user" do
    put :update, {id: @user, 
                  user: { email: @user.email, 
                          name: @user.name, 
                          nickname: @user.nickname, 
                          shares_remaining: @user.shares_remaining, 
                          login: @user.login }},
                 {user_id: @admin_user.id}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, {id: @user},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to users_path
  end
end
