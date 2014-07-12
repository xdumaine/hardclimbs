class Api::V1::AreasController < ApplicationController

  before_action :set_area, only: [:show, :update, :destroy]
  respond_to :json

  # GET /areas
  def index
    respond_with Area.all
  end

  # GET /areas/1
  def show
    respond_with @area
  end

  # POST /areas
  def create
    @area = Area.new(area_params)

    if @area.save
      respond_with @area, status: :created, location: [:api, :v1, @area]
    else
      render json: { errors: @area.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /areas/1
  def update
    if @area.update(area_params)
      respond_with @area, status: :ok, location: [:api, :v1, @area]
    else
      render json: { errors: @area.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /area/1
  def destroy
    @area.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:name, :country)
    end
end
