class MediaTypesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @media_type = MediaType.new
  end
  
  def index
    authorize! :index, @media_type, :message => 'Not authorized as an administrator.'
    @media_types = MediaType.all
  end
  
  def edit
    @media_type = MediaType.find(params[:id])
  end

  def show
    @media_type = MediaType.find(params[:id])
  end
  
  def update
      authorize! :update, @media_type, :message => 'Not authorized as an administrator.'
      @media_type = MediaType.find(params[:id])
      if @media_type.update_attributes(params[:media_type])
        redirect_to media_types_path, :notice => "MediaType updated."
      else
        redirect_to media_types_path, :alert => "Unable to update media type."
      end
    end

  def create
    authorize! :create, @media_type, :message => 'Not authorized as an administrator.'
    @media_type = MediaType.new(params[:media_type])
    if @media_type.save
      flash[:success] = "Thanks for adding a media type!"
      redirect_to @media_type
    else
      render 'new'
    end
  end
    
  def destroy
    authorize! :destroy, @media_type, :message => 'Not authorized as an administrator.'
    media_type = MediaType.find(params[:id])
    media_type.destroy
    redirect_to media_types_path, :notice => "MediaType deleted."
  end
end
