FactoryGirl.define do
  factory :media, :class => 'Media' do
    url "MyString"
    description "Lorem ipsum"
    media_type
    climb {[FactoryGirl.create(:climb)]}
    ascent {[FactoryGirl.create(:ascent)]}
  end
end
