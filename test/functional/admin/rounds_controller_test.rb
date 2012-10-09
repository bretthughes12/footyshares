require 'test_helper'

class Admin::RoundsControllerTest < ActionController::TestCase
  setup do
    @round = FactoryGirl.create(:round)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index, {}, {user_id: @admin_user.id}
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

    assert_redirected_to admin_rounds_path
  end

  test "should not create round when invalid" do
    assert_no_difference('Round.count') do
      post :create, {round: { cutoff_at: @round.cutoff_at, 
                              name: "A"*300, 
                              starts_at: @round.starts_at }},
                    {user_id: @admin_user.id}
    end

    assert_response :success
    assert_template :new
  end

  test "should show round" do
    get :show, {id: @round}, 
               {user_id: @admin_user.id}
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
    assert_redirected_to admin_rounds_path
  end

  test "should not update round when invalid" do
    put :update, {id: @round, 
                  round: { cutoff_at: @round.cutoff_at, 
                           name: "B"*300, 
                           starts_at: @round.starts_at }},
                 {user_id: @admin_user.id}
    assert_response :success
    assert_template :edit
  end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete :destroy, {id: @round},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to admin_rounds_path
  end

  test "should update users and round when shares updated" do
    Round.delete_all
    @round = FactoryGirl.create(:round, shares_remaining: 100)

    post :update_shares, {},
                         {user_id: @admin_user.id}

    user = User.find(@admin_user)
    assert_equal 0, user.shares_remaining
    
    round = Round.find(@round)
    assert_equal 0, round.shares_remaining

    assert_redirected_to admin_teams_path
  end
end
