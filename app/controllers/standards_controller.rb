class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :update, :destroy]

  # GET /standards
  def index
    @standards = Standard.all

    render json: @standards
  end

  # GET /standards/1
  def show
    render json: @standard
  end

  # POST /standards
  def create
    @standard = Standard.new(standard_params)

    if @standard.save
      render json: @standard, status: :created, location: @standard
    else
      render json: @standard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /standards/1
  def update
    if @standard.update(standard_params)
      render json: @standard
    else
      render json: @standard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /standards/1
  def destroy
    @standard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def standard_params
      params.require(:standard).permit(:name, :phone)
    end
end
