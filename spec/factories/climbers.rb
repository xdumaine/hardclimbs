# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :climber do
    first_name Faker::Name.first_name
    last_name Faker::Name.first_name
    height = 100
    dob = '01-01-1990'
  end
end
