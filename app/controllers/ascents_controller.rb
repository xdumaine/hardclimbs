class AscentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  helper_method :join_on, :sort_column, :sort_direction  
  load_and_authorize_resource

  def new
   @ascent = Ascent.new
  end
  
  def index
    if params[:climb_id]
      @climb = Climb.find(params[:climb_id])
      @ascents = @climb.ascents.order_by_join(params[:join_model], sort_column, sort_direction) 
      @title = "Ascents for #{@climb.name}"
    elsif params[:climber_id]
      @climber = Climber.find(params[:climber_id])
      @ascents = @climber.ascents.order_by_join(params[:join_model], sort_column, sort_direction) 
      @title = "Ascents by #{@climber.full_name}"
    elsif params[:area_id]
      @area = Area.find(params[:area_id])
      @ascents = @area.ascents.order_by_join(params[:join_model], sort_column, sort_direction) 
      @title = "Ascents @ #{@area.name}"
    else
      @title = "All Ascents"
      @ascents = Ascent.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
    end 
  end
  
  def edit
    @ascent = Ascent.find(params[:id])
  end

  def show
    if params[:climb_id]
      @climb = Climb.find(params[:climb_id])
      @ascent = @climb.ascents.find(params[:id])
      @title = "Ascent for #{@climb.name}"
    elsif params[:id]
      @ascent = Ascent.find(params[:id])
      @title = "Ascent for #{@ascent.climb.name}"
    end
  end
  
  def update
      ascent_number = params[:ascent][:ascent_number]
      @ascent = Ascent.find(params[:id])
      if @ascent.update_attributes(params[:ascent])
        if (@ascent.ascent_number != nil) && (ascent_number != @ascent.ascent_number.to_s)
          Ascent.increment(@ascent.ascent_number, @ascent.climb_id, @ascent.climber_id)
        end
        redirect_to ascents_path, :notice => "Ascent updated."
      else
        redirect_to ascents_path, :alert => "Unable to update ascent."
      end
    end

  def create
    @ascent = Ascent.new(params[:ascent])
    if @ascent.save
      #re-number ascents around the one we are entering if an ascent number is given 
      if @ascent.ascent_number != nil
        Ascent.increment(@ascent.ascent_number, @ascent.climb_id, @ascent.climber_id)
      end
      flash[:success] = "Thanks for adding an ascent!"
      redirect_to @ascent
    else
      render 'new'
    end
  end
    
  def destroy
    ascent = Ascent.find(params[:id])
    ascent.destroy
    redirect_to ascents_path, :notice => "Ascent deleted."
  end
  
  private  
    def sort_column  
      params[:sort_column] || "date"  
    end  

    def sort_direction  
       %w[asc desc].include?(params[:sort_direction]) ?  params[:sort_direction] : "desc"  
    end
    
    def join_on
      params[:join_on] || nil
    end
end
