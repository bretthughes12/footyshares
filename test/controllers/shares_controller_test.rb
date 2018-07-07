require 'test_helper'

class SharesControllerTest < ActionController::TestCase
  setup do
    @share = FactoryBot.create(:share)
    @admin_user = FactoryBot.create(:user, :admin)
  end

  test "should get shares for investing" do
    get :invest, session: {user_id: @admin_user.id}
    assert_response :success
  end

  test "should update multiple shares for the current round" do
    user = FactoryBot.create(:user, starting_shares: 100)
    match = @share.team.match
    team = @share.team
    other_team = FactoryBot.create(:team, match: match)
    share = FactoryBot.create(:share, team: team, user: user, shares: 50)
    other_share = FactoryBot.create(:share, team: other_team, user: user, shares: 50)
    
    put :update_multiple, params: {shares: {@share.id => { shares: share.shares, 
                                                           team_id: share.team_id, 
                                                           user_id: share.user_id },
                                            other_share.id => { shares: other_share.shares, 
                                                                team_id: other_share.team_id, 
                                                                user_id: other_share.user_id }}}, 
                          session: {user_id: user.id}

    assert_equal "Shares updated", flash[:notice]
    assert_redirected_to invest_shares_path
  end

  test "should not update shares when not equal remaining shares" do
    user = FactoryBot.create(:user, starting_shares: 200)
    match = @share.team.match
    team = @share.team
    other_team = FactoryBot.create(:team, match: match)
    share = FactoryBot.create(:share, team: team, user: user, shares: 50)
    other_share = FactoryBot.create(:share, team: other_team, user: user, shares: 50)
    
    put :update_multiple, params: {shares: {@share.id => { shares: share.shares, 
                                                           team_id: share.team_id, 
                                                           user_id: share.user_id },
                                            other_share.id => { shares: other_share.shares, 
                                                                team_id: other_share.team_id, 
                                                                user_id: other_share.user_id }}}, 
                          session: {user_id: user.id}

    assert_match "should equal your remaining shares", flash[:notice]
    assert_response :success
    assert_template :invest
  end

  test "should not update shares when shares invalid" do
    user = FactoryBot.create(:user, starting_shares: 100)
    match = @share.team.match
    team = @share.team
    other_team = FactoryBot.create(:team, match: match)
    share = FactoryBot.create(:share, team: team, user: user, shares: 0)
    other_share = FactoryBot.create(:share, team: other_team, user: user, shares: 100)
    
    put :update_multiple, params: {shares: {@share.id => { shares: "a", 
                                                           team_id: share.team_id, 
                                                           user_id: share.user_id },
                                            other_share.id => { shares: other_share.shares, 
                                                                team_id: other_share.team_id, 
                                                                user_id: other_share.user_id }}}, 
                          session: {user_id: user.id}

    assert_match "problem updating", flash[:notice]
    assert_redirected_to invest_shares_path
  end

  test "should not update shares when round is closed" do
    Round.delete_all
    user = FactoryBot.create(:user, starting_shares: 100)
    round = FactoryBot.create(:round, cutoff_at: 5.minutes.ago)
    match = FactoryBot.create(:match, round: round)
    team = FactoryBot.create(:team, match: match)
    other_team = FactoryBot.create(:team, match: match)
    share = FactoryBot.create(:share, team: team, user: user, shares: 0)
    other_share = FactoryBot.create(:share, team: other_team, user: user, shares: 100)
    
    put :update_multiple, params: {shares: {@share.id => { shares: share.shares, 
                                                           team_id: share.team_id, 
                                                           user_id: share.user_id },
                                            other_share.id => { shares: other_share.shares, 
                                                                team_id: other_share.team_id, 
                                                                user_id: other_share.user_id }}}, 
                          session: {user_id: user.id}

    assert_match "round is now closed", flash[:notice]
    assert_response :success
    assert_template :invest
  end

  test "should not update multiple shares if match requires one team" do
    user = FactoryBot.create(:user, starting_shares: 100)
    match = FactoryBot.create(:match, allow_only_one_team: true)
    team = FactoryBot.create(:team, match: match)
    other_team = FactoryBot.create(:team, match: match)
    share = FactoryBot.create(:share, team: team, user: user, shares: 50)
    other_share = FactoryBot.create(:share, team: other_team, user: user, shares: 50)
    
    put :update_multiple, params: {shares: {@share.id => { shares: share.shares, 
                                                           team_id: share.team_id, 
                                                           user_id: share.user_id },
                                            other_share.id => { shares: other_share.shares, 
                                                                team_id: other_share.team_id, 
                                                                user_id: other_share.user_id }}}, 
                          session: {user_id: user.id}

    assert_match "must invest your shares against only one team", flash[:notice]
    assert_response :success
    assert_template :invest
  end
end
