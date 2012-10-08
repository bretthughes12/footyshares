require 'test_helper'

class Admin::SharesControllerTest < ActionController::TestCase
  setup do
    @share = FactoryGirl.create(:share)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index, {}, {user_id: @admin_user.id}
    assert_response :success
    assert_not_nil assigns(:shares)
  end

  test "should get new" do
    get :new, {}, {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create share" do
    assert_difference('Share.count') do
      post :create, {share: { shares: @share.shares, 
                              team_id: @share.team_id, 
                              user_id: @share.user_id }},
                    {user_id: @admin_user.id}
    end

    assert_redirected_to admin_shares_path
  end

  test "should show share" do
    get :show, {id: @share}, 
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @share},
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update share" do
    put :update, {id: @share, 
                  share: { shares: @share.shares, 
                           team_id: @share.team_id, 
                           user_id: @share.user_id }},
                 {user_id: @admin_user.id}
    assert_redirected_to admin_shares_path
  end

  test "should destroy share" do
    assert_difference('Share.count', -1) do
      delete :destroy, {id: @share},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to admin_shares_path
  end
end
