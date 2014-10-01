require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "current shareprice should reflect the total shares and remaining shares" do
    user = FactoryGirl.create(:user, starting_shares: 50)

    assert_equal 10, User.current_shareprice
  end

  test "current shareprice should be zero when there are no shares remaining" do
    user = FactoryGirl.create(:user, starting_shares: 50)
    user.shares_remaining = 0
    user.save

    assert_equal 0, User.current_shareprice
  end

  test "update shares remaining should update users shares" do
    match = FactoryGirl.create(:match)
    team1 = FactoryGirl.create(:team, match: match)
    team2 = FactoryGirl.create(:team, match: match, winner: true)
    user = FactoryGirl.create(:user)
    user.shares_remaining = 0
    user.save
    share1 = FactoryGirl.create(:share, team: team1, user: user, shares: 12)
    share2 = FactoryGirl.create(:share, team: team2, user: user, shares: 34)

    User.update_shares_remaining

    user = User.find(user.id)
    assert_equal 34, user.shares_remaining
  end
end
# == Schema Information
#
# Table name: users
#
#  id               :integer(4)      not null, primary key
#  login            :string(255)
#  name             :string(255)
#  hashed_password  :string(255)
#  salt             :string(255)
#  email            :string(255)
#  nickname         :string(255)
#  admin            :boolean(1)      default(FALSE)
#  shares_remaining :integer(4)      default(0)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  starting_shares  :integer(4)      default(0)
#  paid             :boolean(1)      default(FALSE)
#
