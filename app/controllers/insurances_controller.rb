class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :update, :destroy]

  # GET /insurances
  def index
    @insurances = Insurance.all

    render json: @insurances
  end

  # GET /insurances/1
  def show
    render json: @insurance
  end

  # POST /insurances
  def create
    @insurance = Insurance.new(insurance_params)

    if @insurance.save
      render json: @insurance, status: :created, location: @insurance
    else
      render json: @insurance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /insurances/1
  def update
    if @insurance.update(insurance_params)
      render json: @insurance
    else
      render json: @insurance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /insurances/1
  def destroy
    @insurance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def insurance_params
      params.require(:insurance).permit(:name, :phone)
    end
end
