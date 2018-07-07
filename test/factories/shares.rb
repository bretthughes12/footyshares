# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :share do
    team
    user
    shares 50
  end
end
