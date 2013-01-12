class ClimbsController < ApplicationController
  before_filter :authenticate_user!
  def new
   @climb = Climb.new
  end
  
  def index
    authorize! :index, @climb, :message => 'Not authorized as an administrator.'
    @climbs = Climb.all
  end
  
  def edit
    @climb = Climb.find(params[:id])
  end

  def show
    @climb = Climb.find(params[:id])
  end
  
  def update
      authorize! :update, @climb, :message => 'Not authorized as an administrator.'
      @climb = Climb.find(params[:id])
      if @climb.update_attributes(params[:climb], :as => :admin)
        redirect_to climbs_path, :notice => "Climb updated."
      else
        redirect_to climbs_path, :alert => "Unable to update climb."
      end
    end

  def create
    authorize! :create, @climb, :message => 'Not authorized as an administrator.'
    @climb = Climb.new(params[:climb], :as => :admin)
    if @climb.save
      flash[:success] = "Thanks for adding a climb!"
      redirect_to @climb
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @climb, :message => 'Not authorized as an administrator.'
    climb = Climb.find(params[:id])
    climb.destroy
    redirect_to climbs_path, :notice => "Climb deleted."
  end
end
