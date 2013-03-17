# == Schema Information
#
# Table name: medias
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  description   :string(255)
#  media_type_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pull_quote    :text
#

require 'spec_helper'
require 'ruby-debug'
describe Media do
  
  it "has a valid factory" do
    FactoryGirl.create(:media).should be_valid
  end
  
  it "is invalid without a url" do
    FactoryGirl.build(:media, url: nil).should_not be_valid
  end
  
  it "is invalid without a climb or an ascent" do
    FactoryGirl.build(:media, ascent: nil, climb: nil).should_not be_valid
  end 
  
  it "is invalid without a media type" do
    FactoryGirl.build(:media, media_type: nil).should_not be_valid
  end
  
  it "is invalid without a description" do
    FactoryGirl.build(:media, description: nil).should_not be_valid
  end
  
end
