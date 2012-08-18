# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:login)      { |n| "peterpiper#{n}" }
    name                  "MyString"
    password              "secret"
    password_confirmation { |a| "#{a.password}"}
    email                 "My@String.com"
    sequence(:nickname)   { |n| "peter#{n}" }
    admin                 false
    starting_shares       50
    shares_remaining      50
  end
  
  trait :admin do
    admin                 true
  end
end
