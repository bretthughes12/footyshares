# == Schema Information
#
# Table name: matches
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  venue               :string(255)
#  round_id            :integer
#  allow_only_one_team :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :match do
    name {"MyString"}
    venue {"MyString"}
    round
    allow_only_one_team {false}
  end
end
