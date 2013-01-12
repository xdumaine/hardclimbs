class AscentsController < ApplicationController
  before_filter :authenticate_user!
  def new
   @ascent = Ascent.new
  end
  
  def index
    authorize! :index, @ascent, :message => 'Not authorized as an administrator.'
    @ascents = Ascent.all
  end
  
  def edit
    @ascent = Ascent.find(params[:id])
  end

  def show
    @ascent = Ascent.find(params[:id])
  end
  
  def update
      authorize! :update, @ascent, :message => 'Not authorized as an administrator.'
      @ascent = Ascent.find(params[:id])
      if @ascent.update_attributes(params[:ascent], :as => :admin)
        redirect_to ascents_path, :notice => "Ascent updated."
      else
        redirect_to ascents_path, :alert => "Unable to update ascent."
      end
    end

  def create
    authorize! :create, @ascent, :message => 'Not authorized as an administrator.'
    @ascent = Ascent.new(params[:ascent], :as => :admin)
    if @ascent.save
      flash[:success] = "Thanks for adding an ascent!"
      redirect_to @ascent
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @ascent, :message => 'Not authorized as an administrator.'
    ascent = Ascent.find(params[:id])
    ascent.destroy
    redirect_to ascents_path, :notice => "Ascent deleted."
  end
end
