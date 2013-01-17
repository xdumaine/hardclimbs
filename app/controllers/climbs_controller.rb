class ClimbsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  def new
   @climb = Climb.new
  end
  
  def index
    #authorize! :index, @climb, :message => 'Not authorized as an administrator.'
    #@selected_styles = params[:styles] || session[:styles] || {}
    if params[:styles]
      @climbs = Climb.find_all_by_style_id(params[:styles])
    else
      @climbs = Climb.all
    end
    
    #@climbs = Climb.all
  end
  
  def edit
    @climb = Climb.find(params[:id])
  end

  def show
    @climb = Climb.find(params[:id])
  end
  
  def update
      #authorize! :update, @climb, :message => 'Not authorized as an administrator.'
      @climb = Climb.find(params[:id])
      if @climb.update_attributes(params[:climb])
        redirect_to climbs_path, :notice => "Climb updated."
      else
        redirect_to climbs_path, :alert => "Unable to update climb."
      end
    end

  def create
    #authorize! :create, @climb, :message => 'Not authorized as an administrator.'
    @climb = Climb.new(params[:climb])
    if @climb.save
      flash[:success] = "Thanks for adding a climb!"
      redirect_to @climb
    else
      render 'new'
    end
  end
    
  def destroy
    #authorize! :destroy, @climb, :message => 'Not authorized as an administrator.'
    climb = Climb.find(params[:id])
    climb.destroy
    redirect_to climbs_path, :notice => "Climb deleted."
  end
end
