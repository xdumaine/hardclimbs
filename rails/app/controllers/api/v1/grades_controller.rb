class Api::V1::GradesController < ApplicationController

  before_action :set_grade, only: [:show, :update, :destroy]
  respond_to :json

  # GET /grades
  def index
    respond_with Grade.all
  end

  # GET /grades/1
  def show
    respond_with @grade
  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      respond_with @grade, status: :created, location: [:api, :v1, @grade]
    else
      render json: { errors: @grade.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grades/1
  def update
    if @grade.update(grade_params)
      respond_with @grade, status: :ok, location: [:api, :v1, @grade]
    else
      render json: { errors: @grade.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /grade/1
  def destroy
    @grade.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :style_id, :rank)
    end
end
