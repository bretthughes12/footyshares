# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    name "MyString"
    cutoff_at "2013-08-17"
    starts_at "2012-08-17"
  end
end
