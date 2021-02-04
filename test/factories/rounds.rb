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

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :round do
    name {"MyString"}
    cutoff_at {"2025-08-17"}
    starts_at {"2014-08-17"}
    prev_round_id {nil}
  end
end
