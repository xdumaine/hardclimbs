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
      @keywords = "#{@climb.name}"
      @description = "List of Hard Ascents of #{@climb.name}"
    elsif params[:climber_id]
      @climber = Climber.find(params[:climber_id])
      @ascents = @climber.ascents.order_by_join(params[:join_model], sort_column, sort_direction) 
      @title = "Ascents by #{@climber.full_name}"
      @keywords = "#{@climber.full_name}"
      @description = "List of Hard Ascents by #{@climber.full_name}"
    elsif params[:area_id]
      @area = Area.find(params[:area_id])
      @ascents = @area.ascents.order_by_join(params[:join_model], sort_column, sort_direction) 
      @title = "Ascents @ #{@area.name}"
      @keywords = "#{@area.name}"
      @description = "List of Hard Ascents in #{@area.name}"
    else
      @title = "All Ascents"
      @ascents = Ascent.order_by_join(params[:join_model], sort_column, sort_direction).page(params[:page])
      @description = "List of Hard Ascents"
    end 
    set_meta_tags :description => @description
    set_meta_tags :keywords => @keywords
    set_meta_tags :title => @title
  end
  
  def edit
    @ascent = Ascent.find(params[:id])
  end

  def show
    if params[:climb_id]
      @climb = Climb.find(params[:climb_id])
      @ascent = @climb.ascents.find(params[:id])
      @area = @climb.area
      @climber = @ascent.climber
      @title = "Ascent for #{@climb.name}"
    elsif params[:id]
      @ascent = Ascent.find(params[:id])
      @climb = @ascent.climb
      @climber = @ascent.climber
      @area = @climb.area
      @title = "Ascent of #{@climb.name} by #{@climber.full_name}"
    end
    
    @keywords = "#{@climb.name}, #{@climber.full_name}, #{@area.name}"
    set_meta_tags :description => "Details on #{@climber.full_name}'s ascent of #{@climb.name} in #{@area.name} on #{@ascent.date}"
    set_meta_tags :keywords => @keywords
    set_meta_tags :title => @title
  end
  
  def update
      ascent_number = params[:ascent][:ascent_number]
      @ascent = Ascent.find(params[:id])
      respond_to do |format|
        if @ascent.update_attributes(params[:ascent])
          format.html { redirect_to @ascent, notice: 'Ascent was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @ascent.errors, status: :unprocessable_entity }
        end
      end
    end

  def create
    @ascent = Ascent.new(params[:ascent])
    respond_to do |format|
      if @ascent.save
        format.html { redirect_to @ascent, notice: 'Ascent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ascent }
      else
        format.html { render action: 'new' }
        format.json { render json: @ascent.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    ascent = Ascent.find(params[:id])
    ascent.destroy
    respond_to do |format|
      format.html { redirect_to ascents_url, :notice => "Ascent deleted." }
      format.json { head :no_content }
    end
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
