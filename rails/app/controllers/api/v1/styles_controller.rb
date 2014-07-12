class Api::V1::StylesController < ApplicationController

  before_action :set_style, only: [:show, :update, :destroy]
  respond_to :json

  # GET /styles
  def index
    respond_with Style.all
  end

  # GET /styles/1
  def show
    respond_with @style
  end

  # POST /styles
  def create
    @style = Style.new(style_params)

    if @style.save
      respond_with @style, status: :created, location: [:api, :v1, @style]
    else
      render json: { errors: @style.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /styles/1
  def update
    if @style.update(style_params)
      respond_with @style, status: :ok, location: [:api, :v1, @style]
    else
      render json: { errors: @style.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /style/1
  def destroy
    @style.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def style_params
      params.require(:style).permit(:name, :style_id)
    end
end
