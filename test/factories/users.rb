# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :user do
    sequence(:login)      { |n| "peterpiper#{n}" }
    sequence(:name)       { |n| "Peter Piper#{n}" }
    password              "secret"
    password_confirmation { |a| "#{a.password}"}
    email                 "My@String.com"
    sequence(:nickname)   { |n| "peter#{n}" }
    admin                 false
    paid                  false
    starting_shares       50
    shares_remaining      50
  end
  
  trait :admin do
    admin                 true
  end
end
