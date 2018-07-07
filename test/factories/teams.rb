# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :team do
    match
    name "MyString"
    winner false
  end
end
