class MediasController < ApplicationController
  before_filter :authenticate_user!
  def new
   @media = Media.new
  end
  
  def index
    authorize! :index, @media, :message => 'Not authorized as an administrator.'
    @media = Media.all
  end
  
  def edit
    @media = Media.find(params[:id])
  end

  def show
    @media = Media.find(params[:id])
    @ascent = @media.ascent
    @climb = @media.climb
  end
  
  def update
      authorize! :update, @media, :message => 'Not authorized as an administrator.'
      @media = Media.find(params[:id])
      if @media.update_attributes(params[:media])
        redirect_to medias_path, :notice => "Media updated."
      else
        redirect_to medias_path, :alert => "Unable to update media."
      end
    end

  def create
    authorize! :create, @media, :message => 'Not authorized as an administrator.'
    @media = Media.new(params[:media])
    if @media.save
      flash[:success] = "Thanks for adding media!"
      redirect_to @media
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @media, :message => 'Not authorized as an administrator.'
    media = Media.find(params[:id])
    media.destroy
    redirect_to medias_path, :notice => "Media deleted."
  end
end
