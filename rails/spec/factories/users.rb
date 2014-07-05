# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password 'pleaseplease'
    password_confirmation 'pleaseplease'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end