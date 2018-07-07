require 'test_helper'

class Admin::MatchesControllerTest < ActionController::TestCase
  setup do
    @match = FactoryBot.create(:match)
    @admin_user = FactoryBot.create(:user, :admin)
  end

  test "should get index" do
    get :index, session: {user_id: @admin_user.id}
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new, session: {user_id: @admin_user.id}
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, params: {match: { allow_only_one_team: @match.allow_only_one_team, 
                                      name: @match.name, 
                                      round_id: @match.round_id, 
                                      venue: @match.venue }},
                    session: {user_id: @admin_user.id}
    end

    assert_redirected_to admin_matches_path
  end

  test "should not create match when invalid" do
    assert_no_difference('Match.count') do
      post :create, params: {match: { allow_only_one_team: @match.allow_only_one_team, 
                                      name: "A"*300, 
                                      round_id: @match.round_id, 
                                      venue: @match.venue }},
                    session: {user_id: @admin_user.id}
    end

    assert_response :success
    assert_template :new
  end

  test "should not create match when not admin" do
    user = FactoryBot.create(:user)
    
    assert_no_difference('Match.count') do
      post :create, params: {match: { allow_only_one_team: @match.allow_only_one_team, 
                                      name: @match.name, 
                                      round_id: @match.round_id, 
                                      venue: @match.venue }},
                    session: {user_id: user.id}
    end

    assert_match "not authorised", flash[:notice]
    assert_redirected_to root_path
  end

  test "should show match" do
    get :show, params: {id: @match}, 
               session: {user_id: @admin_user.id}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @match},
               session: {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update match" do
    put :update, params: {id: @match, 
                          match: { allow_only_one_team: @match.allow_only_one_team, 
                                   name: @match.name, 
                                   round_id: @match.round_id, 
                                   venue: @match.venue }},
                 session: {user_id: @admin_user.id}
    assert_redirected_to admin_matches_path
  end

  test "should not update match when invalid" do
    put :update, params: {id: @match, 
                          match: { allow_only_one_team: @match.allow_only_one_team, 
                                   name: @match.name, 
                                   round_id: @match.round_id, 
                                   venue: "B"*300 }},
                 session: {user_id: @admin_user.id}
    assert_response :success
    assert_template :edit
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, params: {id: @match},
                       session: {user_id: @admin_user.id}
    end

    assert_redirected_to admin_matches_path
  end
end
