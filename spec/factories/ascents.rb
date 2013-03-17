# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ascent do
    date "2013-01-10"
    ascent_number 1
    grade
    climber
    climb
  end
end