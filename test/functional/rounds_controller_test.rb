require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  setup do
    @round = FactoryGirl.create(:round)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rounds)
  end

  test "should get new" do
    get :new, {}, {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create round" do
    assert_difference('Round.count') do
      post :create, {round: { cutoff_at: @round.cutoff_at, 
                              name: @round.name, 
                              starts_at: @round.starts_at }},
                    {user_id: @admin_user.id}
    end

    assert_redirected_to round_path(assigns(:round))
  end

  test "should show round" do
    get :show, id: @round
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @round},
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update round" do
    put :update, {id: @round, 
                  round: { cutoff_at: @round.cutoff_at, 
                           name: @round.name, 
                           starts_at: @round.starts_at }},
                 {user_id: @admin_user.id}
    assert_redirected_to round_path(assigns(:round))
  end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete :destroy, {id: @round},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to rounds_path
  end
end
