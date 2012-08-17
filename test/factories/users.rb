# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login "MyString"
    name "MyString"
    hashed_password "MyString"
    salt "MyString"
    email "MyString"
    nickname "MyString"
    admin false
    shares_remaining 1
  end
end
