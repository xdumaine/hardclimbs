FactoryGirl.define do
  factory :media, :class => 'Media' do
    url "MyString"
    description "Lorem ipsum"
    media_type
    climbs {[FactoryGirl.create(:climb)]}
    ascents {[FactoryGirl.create(:ascent)]}
  end
end
