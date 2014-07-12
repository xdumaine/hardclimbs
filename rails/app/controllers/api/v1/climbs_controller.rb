class Api::V1::ClimbsController < ApplicationController

  before_action :set_climb, only: [:show, :update, :destroy]
  respond_to :json

  # GET /climbs
  def index
    respond_with Climb.all
  end

  # GET /climbs/1
  def show
    respond_with @climb
  end

  # POST /climbs
  def create
    @climb = Climb.new(climb_params)

    if @climb.save
      respond_with @climb, status: :created, location: [:api, :v1, @climb]
    else
      render json: { errors: @climb.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /climbs/1
  def update
    if @climb.update(climb_params)
      respond_with @climb, status: :ok, location: [:api, :v1, @climb]
    else
      render json: { errors: @climb.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /climb/1
  def destroy
    @climb.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_climb
      @climb = Climb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_params
      params.require(:climb).permit(:name, :media_ids, :style_id, :still_hard, :area_id, :grade_id, :notes)
    end
end
