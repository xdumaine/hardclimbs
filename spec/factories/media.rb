# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media, :class => 'Media' do
    type ""
    url "MyString"
  end
end
