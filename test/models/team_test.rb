require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "total shares should be the sum of all shares for a team" do
    team = FactoryBot.create(:team)
    share1 = FactoryBot.create(:share, team: team)
    share2 = FactoryBot.create(:share, team: team)
    
    assert_equal share1.shares + share2.shares, team.total_shares
  end

  test "total shares should be zero if nobody selected the team" do
    team = FactoryBot.create(:team)
    
    assert_equal 0, team.total_shares
  end

  test "share percentage should be the percentage of shares for a team" do
    user = FactoryBot.create(:user, starting_shares: 200)
    team = FactoryBot.create(:team)
    share1 = FactoryBot.create(:share, team: team, user: user, shares: 50)
    share2 = FactoryBot.create(:share, team: team, user: user, shares: 50)
    calculated_percentage = (team.total_shares * 100).to_f / User.total_shares_invested
    
    assert_equal calculated_percentage, team.share_percentage
  end

  test "share percentage should be zero if nobody selected the team" do
    FactoryBot.create(:user, starting_shares: 200)
    team = FactoryBot.create(:team)
    
    assert_equal 0, team.share_percentage
  end
end
# == Schema Information
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  match_id   :integer(4)
#  name       :string(255)     not null
#  winner     :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

