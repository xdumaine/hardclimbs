# == Schema Information
#
# Table name: climbs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  style_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#  still_hard :boolean
#  area_id    :integer
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
  
end
