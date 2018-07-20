require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  test "should be open when the cutoff time has not passed" do
    round = FactoryBot.create(:round, cutoff_at: 5.days.from_now)

    assert round.open
  end

  test "should not be open when the cutoff time has passed" do
    round = FactoryBot.create(:round, cutoff_at: 5.days.ago)

    assert_equal false, round.open
  end

  test "current should be the most recent round that has started" do
    current_round = FactoryBot.create(:round, starts_at: 5.days.ago)
    older_round = FactoryBot.create(:round, starts_at: 10.days.ago)

    assert_equal current_round, Round.current
  end

  test "current should be empty if no round has started" do
    future_round = FactoryBot.create(:round, starts_at: 5.days.from_now)

    assert_nil Round.current
  end

  test "current should be empty if there are no rounds" do
    assert_nil Round.current
  end

  test "teams should include all teams for the round" do
    round = FactoryBot.create(:round)
    match1 = FactoryBot.create(:match, round: round)
    team1 = FactoryBot.create(:team, match: match1)
    team2 = FactoryBot.create(:team, match: match1)
    match2 = FactoryBot.create(:match, round: round)
    team3 = FactoryBot.create(:team, match: match2)
    team4 = FactoryBot.create(:team, match: match2)

    teams = round.teams
    
    assert teams.include?(team1)
    assert teams.include?(team2)
    assert teams.include?(team3)
    assert teams.include?(team4)
  end

  test "starting shares should the total shares invested for the first round" do
    FactoryBot.create(:user)
    round = FactoryBot.create(:round, prev_round_id: nil)

    assert_equal User.total_shares_invested, round.starting_shares    
  end

  test "starting shares should the previous rounds shares remaining when not the first round" do
    FactoryBot.create(:user)
    first_round = FactoryBot.create(:round, prev_round_id: nil, shares_remaining: 100)
    second_round = FactoryBot.create(:round, prev_round_id: first_round.id)

    assert_equal first_round.shares_remaining, second_round.starting_shares    
  end
end

# == Schema Information
#
# Table name: rounds
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  cutoff_at        :datetime
#  starts_at        :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shares_remaining :integer          default(0)
#  prev_round_id    :integer
#
