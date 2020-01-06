class DenyReasonsController < ApplicationController
  before_action :set_deny_reason, only: [:show, :update, :destroy]

  # GET /deny_reasons
  def index
    @deny_reasons = DenyReason.all

    render json: @deny_reasons
  end

  # GET /deny_reasons/1
  def show
    render json: @deny_reason
  end

  # POST /deny_reasons
  def create
    @deny_reason = DenyReason.new(deny_reason_params)

    if @deny_reason.save
      render json: @deny_reason, status: :created, location: @deny_reason
    else
      render json: @deny_reason.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deny_reasons/1
  def update
    if @deny_reason.update(deny_reason_params)
      render json: @deny_reason
    else
      render json: @deny_reason.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deny_reasons/1
  def destroy
    @deny_reason.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deny_reason
      @deny_reason = DenyReason.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deny_reason_params
      params.require(:deny_reason).permit(:name)
    end
end
