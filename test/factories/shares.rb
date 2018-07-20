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

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :share do
    team
    user
    shares 50
  end
end
