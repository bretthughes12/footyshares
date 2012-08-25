# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    team
    user
    shares 50
  end
end
