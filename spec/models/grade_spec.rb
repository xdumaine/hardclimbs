# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rank       :integer
#  style_id   :integer
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Grade do

    it "has a valid factory" do
        FactoryGirl.create(:grade).should be_valid
    end
    it "is invalid without a name" do
        FactoryGirl.build(:grade, name: nil).should_not be_valid
    end
    
    it "is invalid without a rank" do
        FactoryGirl.build(:grade, rank: nil).should_not be_valid
    end
    
    it "is invalid without a style" do
        FactoryGirl.build(:grade, style: nil).should_not be_valid
    end
    
    it "does not allow duplicate ranks within grades for a given style" do
        style = FactoryGirl.create(:style)
        FactoryGirl.create(:grade, style: style, name:"V1", rank:1)
        FactoryGirl.build(:grade, style: style, name:"V2", rank:1).should_not be_valid
    end
    
end
