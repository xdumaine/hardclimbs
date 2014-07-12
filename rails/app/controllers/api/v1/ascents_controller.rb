class Api::V1::AscentsController < ApplicationController

  before_action :set_ascent, only: [:show, :update, :destroy]
  respond_to :json

  # GET /ascents
  def index
    render json: Ascent.all
    #respond_with Ascent.all
  end

  # GET /ascents/1
  def show
    respond_with @ascent
  end

  # POST /ascents
  def create
    @ascent = Ascent.new(ascent_params)

    if @ascent.save
      respond_with @ascent, status: :created, location: [:api, :v1, @ascent]
    else
      render json: { errors: @ascent.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ascents/1
  def update
    if @ascent.update(ascent_params)
      respond_with @ascent, status: :ok, location: [:api, :v1, @ascent]
    else
      render json: { errors: @ascent.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /ascent/1
  def destroy
    @ascent.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ascent
      @ascent = Ascent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ascent_params
      params.require(:ascent).permit(:date, :climber_id, :climb_id, :media_ids, :grade_id, :ascent_number, 
                                      :notes, :date_end, :media_ids => [])
    end
end
