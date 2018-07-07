require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:user, :admin)
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
      post :create, {user: { email: @user.email, 
                             name: "Fred", 
                             nickname: "fred", 
                             shares_remaining: @user.shares_remaining, 
                             login: "fred",
                             password: "secret",
                             password_confirmation: "secret",
                             starting_shares: 100,
                             admin: false,
                             paid: false }}, 
                    {user_id: @admin_user.id}
    end

    assert_redirected_to admin_users_url
  end

  test "should not create user when invalid" do
    assert_no_difference('User.count') do
      post :create, {user: { email: "bademail", 
                             name: "Fred", 
                             nickname: "fred", 
                             shares_remaining: @user.shares_remaining, 
                             login: "fred",
                             password: "secret",
                             password_confirmation: "secret",
                             starting_shares: 100 }}, 
                    {user_id: @admin_user.id}
    end

    assert_response :success
    assert_template :new
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
                          login: @user.login,
                          admin: false,
                          paid: false }},
                 {user_id: @admin_user.id}
    assert_redirected_to admin_users_url
  end

  test "should not update user when invalid" do
    put :update, {id: @user, 
                  user: { email: "bademail", 
                          name: @user.name, 
                          nickname: @user.nickname, 
                          shares_remaining: @user.shares_remaining, 
                          login: @user.login }},
                 {user_id: @admin_user.id}
    assert_response :success
    assert_template :edit
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, {id: @user},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to admin_users_url
  end
end
