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
  before do @area = Area.new(name:"Area", country:"United States")
  end
  
  subject { @area }
  
  it { should respond_to(:name) }
  it { should respond_to(:country) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @area.name = " " }
    it { should_not be_valid }
  end
  
  describe "when country is not present" do
    before { @area.country = " " }
    it { should_not be_valid }
  end
  
end
