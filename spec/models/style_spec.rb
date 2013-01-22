# == Schema Information
#
# Table name: styles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Style do
  it "has a valid factory" do
    FactoryGirl.create(:style).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:style, name: nil).should_not be_valid
  end
end
