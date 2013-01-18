class AscentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  def new
   @ascent = Ascent.new
  end
  
  def index
    #authorize! :index, @ascent, :message => 'Not authorized as an administrator.'
    if params[:climb_id]
      @climb = Climb.find(params[:climb_id])
      @ascents = @climb.ascents.all
      @title = "Ascents for #{@climb.name}"
      #@ascents = Ascent.find_all_by_climb_id(params[:climb_id])
    elsif params[:climber_id]
      @climber = Climber.find(params[:climber_id])
      @ascents = @climber.ascents.all
      @title = "Ascents by #{@climber.full_name}"
      #@ascents = Ascent.find_all_by_climber_id(params[:climber_id])
    else
      @title = "All Ascents"
      @ascents = Ascent.all
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
      #authorize! :update, @ascent, :message => 'Not authorized as an administrator.'
      ascent_number = params[:ascent][:ascent_number]
      #debugger
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
    #authorize! :create, @ascent, :message => 'Not authorized as an administrator.'
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
    #authorize! :destroy, @ascent, :message => 'Not authorized as an administrator.'
    ascent = Ascent.find(params[:id])
    ascent.destroy
    redirect_to ascents_path, :notice => "Ascent deleted."
  end
end
