class Api::V1::MediaTypesController < ApplicationController

  before_action :set_media_type, only: [:show, :update, :destroy]
  respond_to :json

  # GET /media_types
  def index
    respond_with MediaType.all
  end

  # GET /media_types/1
  def show
    respond_with @media_type
  end

  # POST /media_types
  def create
    @media_type = MediaType.new(media_type_params)

    if @media_type.save
      respond_with @media_type, status: :created, location: [:api, :v1, @media_type]
    else
      render json: { errors: @media_type.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /media_types/1
  def update
    if @media_type.update(media_type_params)
      respond_with @media_type, status: :ok, location: [:api, :v1, @media_type]
    else
      render json: { errors: @media_type.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /media_type/1
  def destroy
    @media_type.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_media_type
      @media_type = MediaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_type_params
      params.require(:media_type).permit(:name)
    end
end
