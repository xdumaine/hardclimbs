require 'spec_helper'

describe ClimbersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @climber = FactoryGirl.create(:climber, :sex => "M")
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @climber.id
      response.should be_success
    end
    
    it "should find the right climber" do
      get :show, :id => @climber.id
      assigns(:climber).should == @climber
    end
    
  end
  
  describe "GET 'edit'" do
    
    it "should be successful" do
      get :edit, :id => @climber.id
      response.should be_success
    end
    
    it "should show the right climber for editing" do
      get :edit, :id => @climber.id
      assigns(:climber).should == @climber
    end
    
  end

  describe "Get 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  # UPDATE
  describe "PUT climbers/:id" do

    it 'should retrieve the right climber from Climber model to update' do
      Climber.should_receive(:find).with(@climber.id.to_s).and_return(@climber)
      put :update, :id => @climber.id, :climber => {:first_name => @climber.first_name}
    end

    it 'should prepare the movie object available for update' do
      put :update, :id => @climber.id, :climber => {:first_name => @climber.first_name}
      assigns(:climber).should == @climber
    end

    it 'should pass movie object the new attribute value to updated' do
      first_name = 'John'
      Climber.stub(:find).and_return(@climber)      
      @climber.should_receive(:update_attributes!).with("first_name" => first_name).and_return(:true)
      put :update, :id => @climber.id, :climber => {:first_name => first_name}
    end
  end
  
  describe 'DELETE destroy' do
    before :each do
        @climber = FactoryGirl.create(:climber, :sex =>"M")
      end
    it "deletes the climber" do
      expect{
        delete :destroy, id: @climber        
      }.to change(Climber,:count).by(-1)
    end

    it "redirects to climbers#index" do
      delete :destroy, id: @climber
      response.should redirect_to climbers_url
    end
  end
end
