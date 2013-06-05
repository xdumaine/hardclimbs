class ClimbsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :load_climb_list]
  helper_method :join_on, :sort_column, :sort_direction 
  load_and_authorize_resource :except => [:load_climb_list]
  
  add_breadcrumb "Climbs", :climbs_path
  
  def new
   @climb = Climb.new
   if (params[:area_id])
     @climb.area = Area.find(params[:area_id])
   end
  end
  
  def index
    if params[:styles]
      @climbs = Climb.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page]).where(:style_id => params[:styles])
      session[:style_id] = params[:styles]
      @style = Style.find(params[:styles])
      @title = "Climbs for style #{@style.name}"
      @keywords = "#{@style.name}"
      @description = "List of Hard #{@style.name} Ascents"
    elsif params[:area_id]
      @area = Area.find(params[:area_id])
      @climbs = @area.climbs.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
      @title = "Climbs @ #{@area.name}"
      @keywords = "#{@area.name}"
      @description = "List of Hard Climbs in #{@area.name}"
    else
      if (session[:style_id] && params[:join_model])
        @climbs = Climb.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page]).where(:style_id => session[:style_id])
      else
        session[:style_id] = nil
        @climbs = Climb.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
      end
      @title = "All Climbs"
      @description = "All Hard Climbs"
    end
    set_meta_tags :description => @description
    set_meta_tags :keywords => @keywords
    set_meta_tags :title => @title
  end
  
  def edit
    @climb = Climb.find(params[:id])
  end

  def show
    add_breadcrumb @climb.name, climb_path(@climb)
    @climb = Climb.find(params[:id])
    @first_ascent = @climb.ascents.where(:ascent_number => 1).first
    @title = "Ascents for #{@climb.name}"
    @keywords = "#{@climb.name}, #{@climb.area.name}"
    @description = "List of Ascents of #{@climb.name}"
    set_meta_tags :description => @description
    set_meta_tags :keywords => @keywords
    set_meta_tags :title => @title
  end
  
  def update
      @climb = Climb.find(params[:id])
      if @climb.update_attributes(params[:climb])
        redirect_to @climb, :notice => "Climb updated."
      else
        redirect_to @climb, :alert => "Unable to update climb."
      end
    end

  def create
    @climb = Climb.new(params[:climb])
    if @climb.save
      flash[:success] = "Thanks for adding a climb!"
      redirect_to @climb
    else
      render 'new'
    end
  end
    
  def destroy
    climb = Climb.find(params[:id])
    climb.destroy
    redirect_to climbs_path, :notice => "Climb deleted."
  end
  
  def load_climb_list
    @climb_names = Array.new
    Climb.order(:name).each do |c|
      @climb_names << { :name => c.name, :value => c.name, :style => c.style.name, :sends => TextHelper.pluralize(c.ascents_count, 'Ascent'), :grade => c.grade.name }
    end
    render json: @climb_names
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
