require 'test_helper'

class Admin::TeamsControllerTest < ActionController::TestCase
  setup do
    @team = FactoryGirl.create(:team)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index, {}, {user_id: @admin_user.id}
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new, {}, {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, {team: { match_id: @team.match_id, 
                             name: @team.name, 
                             winner: @team.winner }},
                    {user_id: @admin_user.id}
    end

    assert_redirected_to admin_teams_path
  end

  test "should not create team when invalid" do
    assert_no_difference('Team.count') do
      post :create, {team: { match_id: @team.match_id, 
                             name: "A"*300, 
                             winner: @team.winner }},
                    {user_id: @admin_user.id}
    end

    assert_response :success
    assert_template :new
  end

  test "should show team" do
    get :show, {id: @team}, 
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @team},
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update team" do
    put :update, {id: @team, 
                  team: { match_id: @team.match_id, 
                          name: @team.name, 
                          winner: @team.winner }},
                 {user_id: @admin_user.id}
    assert_redirected_to admin_teams_path
  end

  # test "should not update team when invalid" do
    # put :update, {id: @team, 
                  # team: { match_id: @team.match_id, 
                          # name: "B"*300, 
                          # winner: @team.winner }},
                 # {user_id: @admin_user.id}
    # assert_response :success
    # assert_template :edit
  # end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, {id: @team},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to admin_teams_path
  end
end
