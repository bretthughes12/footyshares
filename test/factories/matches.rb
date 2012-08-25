# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    name "MyString"
    venue "MyString"
    round
    allow_only_one_team false
  end
end
