# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  login            :string(255)
#  name             :string(255)
#  hashed_password  :string(255)
#  salt             :string(255)
#  email            :string(255)
#  nickname         :string(255)
#  admin            :boolean          default(FALSE)
#  shares_remaining :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  starting_shares  :integer          default(0)
#  paid             :boolean          default(FALSE)
#

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
