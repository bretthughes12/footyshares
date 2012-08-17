# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    match_id 1
    name "MyString"
    winner false
  end
end
