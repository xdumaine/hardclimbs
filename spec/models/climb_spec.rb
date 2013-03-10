# == Schema Information
#
# Table name: climbs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  style_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string(255)
#  still_hard     :boolean          default(TRUE)
#  area_id        :integer
#  climbers_count :integer          default(0)
#  ascents_count  :integer          default(0)
#  medias_count   :integer          default(0)
#

require 'spec_helper'

describe Climb do
  it "has a valid factory" do
    FactoryGirl.create(:climb).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:climb, name: nil).should_not be_valid
  end
  
  it "is invalid without a style" do
    FactoryGirl.build(:climb, style: nil).should_not be_valid
  end
  
  it "is invalid without an area" do
    FactoryGirl.build(:climb, area: nil).should_not be_valid
  end
  
  it "returns a climbs's climb_area_name as a string" do
    climb = FactoryGirl.build(:climb)
    climb.climb_area_name.should == "#{climb.name} (#{climb.area.name})"
  end
  
  it "is invalid if a climb with the same name already exists in an area" do
    area = FactoryGirl.create(:area)
    climb = FactoryGirl.create(:climb)
    FactoryGirl.create(:climb, area: area)
    FactoryGirl.build(:climb, area: area).should_not be_valid
  end
  
end
