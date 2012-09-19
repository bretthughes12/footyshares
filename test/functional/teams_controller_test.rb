require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = FactoryGirl.create(:team)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index
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

    assert_redirected_to teams_path
  end

  test "should show team" do
    get :show, id: @team
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
    assert_redirected_to teams_path
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, {id: @team},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to teams_path
  end
end
