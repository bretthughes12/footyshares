# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :round do
    name "MyString"
    cutoff_at "2018-08-17"
    starts_at "2014-08-17"
    prev_round_id nil
  end
end
