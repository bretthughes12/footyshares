# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    association :team
    association :user
    shares 1
  end
end
