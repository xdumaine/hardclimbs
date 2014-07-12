class Api::V1::MediasController < ApplicationController

  before_action :set_media, only: [:show, :update, :destroy]
  respond_to :json

  # GET /medias
  def index
    respond_with Media.all
  end

  # GET /medias/1
  def show
    respond_with @media
  end

  # POST /medias
  def create
    @media = Media.new(media_params)

    if @media.save
      respond_with @media, status: :created, location: [:api, :v1, @media]
    else
      render json: { errors: @media.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medias/1
  def update
    if @media.update(media_params)
      respond_with @media, status: :ok, location: [:api, :v1, @media]
    else
      render json: { errors: @media.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_media
      @media = Media.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_params
      params.require(:media).permit(:url, :description, :media_type_id, :climb_ids, :pull_quote, :ascent_ids => [])
    end
end
