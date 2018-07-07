require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:user, :admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
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

  test "should not allow editing another user" do
    get :edit, {id: @admin_user},
               {user_id: @user.id}
    assert_match "not authorised", flash[:notice]
    assert_redirected_to root_path
  end

  test "should not allow editing user if not logged on" do
    get :edit, {id: @admin_user},
               {}
    assert_match "must log in", flash[:notice]
    assert_redirected_to login_path
  end

  test "should update user" do
    put :update, {id: @user, 
                  user: { email: @user.email, 
                          name: @user.name, 
                          nickname: @user.nickname, 
                          login: @user.login }},
                 {user_id: @user.id}
    assert_redirected_to root_path
  end

  test "should not update user when invalid" do
    put :update, {id: @user, 
                  user: { email: "bademail", 
                          name: @user.name, 
                          nickname: @user.nickname, 
                          login: @user.login }},
                 {user_id: @user.id}
    assert_response :success
    assert_template :edit
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, {id: @user},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to users_path
  end
end
