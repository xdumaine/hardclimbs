class AreasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  helper_method :join_on, :sort_column, :sort_direction 
  
  add_breadcrumb "Areas", :areas_path
  
  def new
   @area = Area.new
  end
  
  def index
    @areas = Area.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
    @title = "All Areas"
    @description = "List of Areas"
    set_meta_tags :description => @description
    set_meta_tags :title => @title
  end
  
  def edit
    @area = Area.find(params[:id])
  end

  def show
    @area = Area.find(params[:id])
    add_breadcrumb @area.name, area_path(@area)
    @climbs = @area.climbs.order('name desc').page(params[:page])
    @title = "Ascents for #{@area.name}"
    @keywords = "#{@area.name}"
    @description = "List of Ascents in #{@area.name}"
    set_meta_tags :description => @description
    set_meta_tags :keywords => @keywords
    set_meta_tags :title => @title
  end
  
  def update
      @area = Area.find(params[:id])
      if @area.update_attributes(params[:area])
        redirect_to @area, :notice => "Area updated."
      else
        redirect_to @area, :alert => "Unable to update area."
      end
    end

  def create
    @area = Area.new(params[:area])
    if @area.save
      flash[:success] = "Thanks for adding an area!"
      redirect_to @area
    else
      render 'new'
    end
  end
    
  def destroy
    area = Area.find(params[:id])
    area.destroy
    redirect_to areas_path, :notice => "Area deleted."
  end
  
  private  
    def sort_column  
      params[:sort_column] || "name"  
    end  

    def sort_direction  
       %w[asc desc].include?(params[:sort_direction]) ?  params[:sort_direction] : "asc"  
    end
    
    def join_on
      params[:join_on] || nil
    end
end
