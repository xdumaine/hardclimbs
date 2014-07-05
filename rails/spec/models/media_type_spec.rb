# == Schema Information
#
# Table name: media_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe MediaType do
  it "has a valid factory" do
    FactoryGirl.create(:media_type).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:media_type, name: nil).should_not be_valid
  end  
  
end
