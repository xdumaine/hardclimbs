class AreasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  helper_method :join_on, :sort_column, :sort_direction 
  def new
   @area = Area.new
  end
  
  def index
    @areas = Area.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
  end
  
  def edit
    @area = Area.find(params[:id])
  end

  def show
    @area = Area.find(params[:id])
  end
  
  def update
      authorize! :update, @area, :message => 'Not authorized as an administrator.'
      @area = Area.find(params[:id])
      if @area.update_attributes(params[:area])
        redirect_to areas_path, :notice => "Area updated."
      else
        redirect_to areas_path, :alert => "Unable to update area."
      end
    end

  def create
    authorize! :create, @area, :message => 'Not authorized as an administrator.'
    @area = Area.new(params[:area])
    if @area.save
      flash[:success] = "Thanks for adding an area!"
      redirect_to @area
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @area, :message => 'Not authorized as an administrator.'
    area = Area.find(params[:id])
    area.destroy
    redirect_to areas_path, :notice => "Area deleted."
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
