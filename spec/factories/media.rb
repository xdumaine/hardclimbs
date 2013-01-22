# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media, :class => 'Media' do
    url "MyString"
    description "Lorem ipsum"
    media_type
    #climb
    ascent
  end
end
