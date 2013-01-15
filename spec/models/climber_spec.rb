# == Schema Information
#
# Table name: climbers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  sex        :string(255)
#  dob        :date
#  height     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

require 'spec_helper'

describe Climber do
  before do @climber = Climber.new(first_name:"Test", last_name:"Name", sex:"M", dob: "01/01/2011", height: "100")
  end
  
  subject { @climber }
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:sex) }
  it { should respond_to(:dob) }
  it { should respond_to(:height) }
  
  it { should be_valid }
  
  describe "when first_name is not present" do
    before { @climber.first_name = " " }
    it { should_not be_valid }
  end
  
  describe "when last_name is not present" do
    before { @climber.last_name = " " }
    it { should_not be_valid }
  end
  
  describe "when sex is not present" do
    before { @climber.sex = " " }
    it { should_not be_valid }
  end
  
  describe "when sex is valid" do
    it "should be valid" do
      @climber.sex ="M"
      @climber.should be_valid
    end
  end
  
  describe "when sex is invalid" do
    it "should be invalid" do
      @climber.sex = "Y"
      @climber.should_not be_valid
    end
  end
  
end
