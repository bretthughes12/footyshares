# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:login)      { |n| "peterpiper#{n}" }
    name                  "MyString"
    password              "secret"
    password_confirmation { |a| "#{a.password}"}
    email                 "My@String.com"
    nickname              "MyString"
    admin                 false
    starting_shares       1
    shares_remaining      1
  end
  
  trait :admin do
    admin                 true
  end
end
