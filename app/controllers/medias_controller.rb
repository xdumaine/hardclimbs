class MediasController < ApplicationController
  before_filter :authenticate_user!
  def new
   @media = Medias.new
  end
  
  def index
    authorize! :index, @media, :message => 'Not authorized as an administrator.'
    @medias = Medias.all
  end
  
  def edit
    @media = Medias.find(params[:id])
  end

  def show
    @media = Medias.find(params[:id])
  end
  
  def update
      authorize! :update, @media, :message => 'Not authorized as an administrator.'
      @media = Medias.find(params[:id])
      if @media.update_attributes(params[:media], :as => :admin)
        redirect_to medias_path, :notice => "Media updated."
      else
        redirect_to medias_path, :alert => "Unable to update media."
      end
    end

  def create
    authorize! :create, @media, :message => 'Not authorized as an administrator.'
    @media = Medias.new(params[:media], :as => :admin)
    if @media.save
      flash[:success] = "Thanks for adding media!"
      redirect_to @media
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @media, :message => 'Not authorized as an administrator.'
    media = Medias.find(params[:id])
    media.destroy
    redirect_to medias_path, :notice => "Media deleted."
  end
end
