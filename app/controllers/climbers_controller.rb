class ClimbersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  helper_method :join_on, :sort_column, :sort_direction  
  load_and_authorize_resource
  def new
    @climber = Climber.new
  end
  
  def index
    @climbers = Climber.order(sort_column + " " + sort_direction).page(params[:page])
  end
  
  def edit
    @climber = Climber.find(params[:id])
  end

  def show
    @climber = Climber.find(params[:id])
  end
  
  def update
      @climber = Climber.find(params[:id])
      if @climber.update_attributes(params[:climber])
        redirect_to climbers_path, :notice => "Climber updated."
      else
        redirect_to climbers_path, :alert => "Unable to update climber."
      end
    end

  def create
    @climber = Climber.new(params[:climber])
    if @climber.save
      flash[:success] = "Thanks for adding a climber!"
      redirect_to @climber
    else
      render 'new'
    end
  end
    
  def destroy
    climber = Climber.find(params[:id])
    climber.destroy
    redirect_to climbers_path, :notice => "Climber deleted."
  end
  
  private  
    def sort_column  
      params[:sort_column] || "id"  
    end  

    def sort_direction 
       %w[asc desc].include?(params[:sort_direction]) ?  params[:sort_direction] : "asc"  
    end
    
    def join_on
      params[:join_on] || nil
    end
end
