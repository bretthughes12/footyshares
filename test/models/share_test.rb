require 'test_helper'

class ShareTest < ActiveSupport::TestCase
  test "team name should be the name of the team" do
    share = FactoryBot.create(:share)

    assert_equal share.team.name, share.team_name
  end

  test "team name should be blank when there is no team" do
    share = FactoryBot.create(:share, team: nil)

    assert_equal "", share.team_name
  end

  test "round name should be the name of the round" do
    share = FactoryBot.create(:share)

    assert_equal share.team.match.round.name, share.round_name
  end

  test "round name should be blank when there is no team" do
    share = FactoryBot.create(:share, team: nil)

    assert_equal "", share.round_name
  end

  test "round should be the teams matches round" do
    share = FactoryBot.create(:share)

    assert_equal share.team.match.round, share.round
  end

  test "round name should be nil when there is no team" do
    share = FactoryBot.create(:share, team: nil)

    assert_nil share.round
  end

  test "prepare should create a bunch of empty shares" do
    user = FactoryBot.create(:user)
    match = FactoryBot.create(:match)
    team1 = FactoryBot.create(:team, match: match)
    team2 = FactoryBot.create(:team, match: match)

    shares = Share.prepare_for_user_and_round(user, match.round)

    assert_equal 2, shares.size
  end

  test "prepare should create an empty array if one of the inputs is missing" do
    user = FactoryBot.create(:user)
    match = FactoryBot.create(:match)
    team1 = FactoryBot.create(:team, match: match)
    team2 = FactoryBot.create(:team, match: match)

    assert_equal [], Share.prepare_for_user_and_round(nil, match.round)
    assert_equal [], Share.prepare_for_user_and_round(user, nil)
  end
  
  test "store should store a record when valid" do
    user = FactoryBot.create(:user)
    team = FactoryBot.create(:team)
    
    assert Share.store(user.id, team.id, 50)
  end
  
  test "store should store a record when shares is nil" do
    user = FactoryBot.create(:user)
    team = FactoryBot.create(:team)
    
    assert Share.store(user.id, team.id, nil)
  end
  
  test "store should not store a record when invalid" do
    user = FactoryBot.create(:user)
    team = FactoryBot.create(:team)
    
    assert_equal false, Share.store(user.id, team.id, "a")
  end
end

# == Schema Information
#
# Table name: shares
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  shares     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
