# == Schema Information
#
# Table name: areas
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  country       :string(255)
#  slug          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climbs_count  :integer          default(0)
#  ascents_count :integer          default(0)
#

require 'spec_helper'

describe Area do
  
  it "has a valid factory" do
    FactoryGirl.create(:area).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:area, name: nil).should_not be_valid
  end
  
  it "is invalid without a country" do
    FactoryGirl.build(:area, country: nil).should_not be_valid
  end
  
  it "returns a areas's area_country as a string" do
    area = FactoryGirl.build(:area)
    area.area_country.should == "#{area.country} #{area.name}"
  end
  
end
