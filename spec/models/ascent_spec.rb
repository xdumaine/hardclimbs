# == Schema Information
#
# Table name: ascents
#
#  id            :integer          not null, primary key
#  date          :date
#  climb_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climber_id    :integer
#  slug          :string(255)
#  grade_id      :integer
#  ascent_number :integer
#

# == Schema Information
#
# Table name: ascents
#
#  id            :integer          not null, primary key
#  date          :date
#  climb_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climber_id    :integer
#  slug          :string(255)
#  grade_id      :integer
#  ascent_number :integer
#

require 'spec_helper'

describe Ascent do
  it "has a valid factory" do
    FactoryGirl.create(:ascent).should be_valid
  end
  
  it "is invalid without a climb" do
    FactoryGirl.build(:ascent, climb: nil).should_not be_valid
  end
  
  it "is invalid without a climber" do
    FactoryGirl.build(:ascent, climber: nil).should_not be_valid
  end
  
  it "does not allow duplicate climbs per climber" do
    climber = FactoryGirl.create(:climber)
    climb = FactoryGirl.create(:climb)
    FactoryGirl.create(:ascent, climber: climber, climb: climb)
    FactoryGirl.build(:ascent, climber: climber, climb: climb).should_not be_valid
  end
  
  it "returns a ascent's climber-climb as a string" do
    ascent = FactoryGirl.build(:ascent)
    ascent.ascent_name_climber_climb.should == "#{ascent.climber.full_name} #{ascent.climb.name}"
  end
  
end
