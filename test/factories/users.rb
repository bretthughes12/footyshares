# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login                 "MyString"
    name                  "MyString"
    password              "secret"
    password_confirmation { |a| "#{a.password}"}
    email                 "MyString"
    nickname              "MyString"
    admin                 false
    starting_shares       1
    shares_remaining      1
  end
end
