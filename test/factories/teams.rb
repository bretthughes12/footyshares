# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  name       :string(255)      not null
#  winner     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :team do
    match
    name "MyString"
    winner false
  end
end
