class ClimbersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  helper_method :join_on, :sort_column, :sort_direction  
  load_and_authorize_resource
  
  add_breadcrumb "Climbers", :climbers_path.to_s
  
  def new
    @climber = Climber.new
  end
  
  def index
    @climbers = Climber.order(sort_column + " " + sort_direction).page(params[:page])
    set_meta_tags :title => 'All Climbers'
  end
  
  def edit
    @climber = Climber.find(params[:id])
  end

  def show
    add_breadcrumb @climber.full_name, climber_path(@climber).to_s
    @climber = Climber.find(params[:id])
    if sort_column == "last_name"
      @ascents = @climber.ascents.order('date asc')
    else
      @ascents = @climber.ascents.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
    end
    set_meta_tags :description => "List of Hard Ascents by #{@climber.full_name}"
    set_meta_tags :keywords => "#{@climber.full_name}"
    set_meta_tags :title => "#{@climber.full_name}"
  end
  
  def update
      @climber = Climber.find(params[:id])
      if @climber.update_attributes(params[:climber])
        redirect_to @climber, :notice => "Climber updated."
      else
        redirect_to @climber, :alert => "Unable to update climber."
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
      params[:sort_column] || "last_name"  
    end  

    def sort_direction 
       %w[asc desc].include?(params[:sort_direction]) ?  params[:sort_direction] : "asc"  
    end
    
    def join_on
      params[:join_on] || nil
    end
end
