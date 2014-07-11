class Api::V1::ClimbersController < ApplicationController

  before_action :set_climber, only: [:show, :update, :destroy]
  respond_to :json

  # GET /climbers
  def index
    render json: Climber.all
    #respond_with Climber.all
  end

  # GET /climbers/1
  def show
    respond_with @climber
  end

  # POST /climbers
  def create
    @climber = Climber.new(climber_params)

    if @climber.save
      respond_with @climber, status: :created, location: [:api, :v1, @climber]
    else
      render json: { errors: @climber.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /climbers/1
  def update
    if @climber.update(climber_params)
      respond_with @climber, status: :ok, location: [:api, :v1, @climber]
    else
      render json: { errors: @climber.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /climber/1
  def destroy
    @climber.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_climber
      @climber = Climber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climber_params
      params.require(:climber).permit(:first_name, :last_name, :dob, :height, :sex, :slug)
    end
end
