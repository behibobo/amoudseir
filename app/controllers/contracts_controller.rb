class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :update, :destroy]

  # GET /contracts
  def index
    if current_user.admin?
      @contracts = Contract.paginate(page: params[:page], per_page: params[:page_size])
      @total_records = Contract.count
    elsif current_user.customer?
      @contracts = current_user.customer_contracts.paginate(page: params[:page], per_page: params[:page_size])
      @total_records = current_user.customer_contracts.count
    elsif current_user.technician?
      @contracts = current_user.technician_contracts.paginate(page: params[:page], per_page: params[:page_size])
      @total_records = current_user.technician_contracts.count
    end
    render json: {data: ActiveModelSerializers::SerializableResource.new(@contracts), total_records: @total_records }
  end

  # GET /contracts/1
  def show
    render json: @contract
  end

  # POST /contracts
  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      render json: @contract, status: :created, location: @contract
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contracts/1
  def update
    if @contract.update(contract_params)
      render json: @contract
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contracts/1
  def destroy
    @contract.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_params
      params.require(:contract).permit(
        :title, :user_id, :customer_id, 
        :description, :start_date, :finish_date, 
        :total_price, :address, :insurance_id, 
        :insurance_finish_date, :standard_id, 
        :standard_finish_date, :swing, :automatic, 
        :elevator_type, :floors, :stops, :service_day, 
        :usage, :capacity, :automatic_door_name, :serial_number,
        :towing_wire, :engine_room, :panel_type, :panel_name,
        :drive, :feedback, :engine, :engine_type, :power, :car_communication,
        :contract_number, :insurance_date, :insurance_type)
    end
end
