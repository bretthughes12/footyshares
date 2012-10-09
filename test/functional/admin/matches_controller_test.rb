require 'test_helper'

class Admin::MatchesControllerTest < ActionController::TestCase
  setup do
    @match = FactoryGirl.create(:match)
    @admin_user = FactoryGirl.create(:user, :admin)
  end

  test "should get index" do
    get :index, {}, {user_id: @admin_user.id}
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new, {}, {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, {match: { allow_only_one_team: @match.allow_only_one_team, 
                              name: @match.name, 
                              round_id: @match.round_id, 
                              venue: @match.venue }},
                    {user_id: @admin_user.id}
    end

    assert_redirected_to admin_matches_path
  end

  test "should not create match when invalid" do
    assert_no_difference('Match.count') do
      post :create, {match: { allow_only_one_team: @match.allow_only_one_team, 
                              name: "A"*300, 
                              round_id: @match.round_id, 
                              venue: @match.venue }},
                    {user_id: @admin_user.id}
    end

    assert_response :success
    assert_template :new
  end

  test "should not create match when not admin" do
    user = FactoryGirl.create(:user)
    
    assert_no_difference('Match.count') do
      post :create, {match: { allow_only_one_team: @match.allow_only_one_team, 
                              name: @match.name, 
                              round_id: @match.round_id, 
                              venue: @match.venue }},
                    {user_id: user.id}
    end

    assert_match "not authorised", flash[:notice]
    assert_redirected_to root_path
  end

  test "should show match" do
    get :show, {id: @match}, 
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @match},
               {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update match" do
    put :update, {id: @match, 
                  match: { allow_only_one_team: @match.allow_only_one_team, 
                           name: @match.name, 
                           round_id: @match.round_id, 
                           venue: @match.venue }},
                 {user_id: @admin_user.id}
    assert_redirected_to admin_matches_path
  end

  test "should not update match when invalid" do
    put :update, {id: @match, 
                  match: { allow_only_one_team: @match.allow_only_one_team, 
                           name: @match.name, 
                           round_id: @match.round_id, 
                           venue: "B"*300 }},
                 {user_id: @admin_user.id}
    assert_response :success
    assert_template :edit
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, {id: @match},
                       {user_id: @admin_user.id}
    end

    assert_redirected_to admin_matches_path
  end
end
