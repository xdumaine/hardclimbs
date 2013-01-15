class ClimbersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  def new
    @climber = Climber.new
  end
  
  def index
    #authorize! :index, @climber, :message => 'Not authorized as an administrator.'
    @climbers = Climber.all
  end
  
  def edit
    @climber = Climber.find(params[:id])
  end

  def show
    @climber = Climber.find(params[:id])
  end
  
  def update
      #authorize! :update, @climber, :message => 'Not authorized as an administrator.'
      @climber = Climber.find(params[:id])
      if @climber.update_attributes(params[:climber], :as => :admin)
        redirect_to climbers_path, :notice => "Climber updated."
      else
        redirect_to climbers_path, :alert => "Unable to update climber."
      end
    end

  def create
    #authorize! :create, @climber, :message => 'Not authorized as an administrator.'
    @climber = Climber.new(params[:climber], :as => :admin)
    if @climber.save
      flash[:success] = "Thanks for adding a climber!"
      redirect_to @climber
    else
      render 'new'
    end
  end
    
  def destroy
    #authorize! :destroy, @climber, :message => 'Not authorized as an administrator.'
    climber = Climber.find(params[:id])
    climber.destroy
    redirect_to climbers_path, :notice => "Climber deleted."
  end
end
