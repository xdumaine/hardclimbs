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
      if @media_type.update(media_types_params)
        redirect_to @media_type, :notice => "Media Type updated."
      else
        redirect_to @media_type, :alert => "Unable to update Media Type."
      end
    end

  def create
    authorize! :create, @media_type, :message => 'Not authorized as an administrator.'
    @media_type = MediaType.new(media_types_params)
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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def media_types_params
      params.require(:media_type).permit(:name)
    end
end
