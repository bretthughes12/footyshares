# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    name "MyString"
    cutoff_at Date.today + 1.day
    starts_at "2014-08-17"
    prev_round_id nil
  end
end
