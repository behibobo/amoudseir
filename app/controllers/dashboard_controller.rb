class DashboardController < ApplicationController
  def index
    today = Date.today.to_pdate.day
    tomorrow = Date.tomorrow.to_pdate.day

    @today_services = Contract.where(service_day: today)
    @tomorrow_services = Contract.where(service_day: tomorrow)

    contracts = Contract.all
    @services = []
    (1..30).each do |item|
      cnt = Contract.where(service_day: item).count
      hash = {key: item, value: cnt}
      @services.push hash
    end

    users = User.where(role: "technician")
    @user_services = []

    users.each do |user|
      cnt = Service.where(status: "done").where(user: user).count
      hash = {key: user.full_name, value: cnt}
      @user_services.push(hash)
    end

    charts = {
      services: @services,
      user_services: @user_services
    }

    repair = Service.where(status: :open).where(request_type: :repair)
    repair_services = []

    repair.each do |r|
      hash = {id: r.id, contract_id: r.contract.id, title: r.contract.title, lat: r.contract.lat, lng: r.contract.lng}
      repair_services.push(hash)
    end

    monthly = Service.where(status: :open).where(request_type: :monthly)
    monthly_services = []

    monthly.each do |r|
      hash = {id: r.id, contract_id: r.contract.id, title: r.contract.title, lat: r.contract.lat, lng: r.contract.lng}
      monthly_services.push(hash)
    end

    render json: {
      today_services: ActiveModelSerializers::SerializableResource.new(@today_services),
      tomorrow_services: ActiveModelSerializers::SerializableResource.new(@tomorrow_services),
      today: today.to_s,
      tomorrow: tomorrow.to_s,
      charts: charts,
      repair: repair_services,
      monthly: monthly_services
    }
  end

  def contracts
    @due_contracts = Contract.where('finish_date < ?', Date.today + 2.month)
    .map{|c| [
      id: c.id, 
      finish_date: c.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract_number, 
      title: c.title
    ]}
    @due_insurances = Contract.where('insurance_finish_date < ?', Date.today + 1.month)
    .map{|c| [
      id: c.id, 
      finish_date: c.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract_number, 
      title: c.title
    ]}    
    @due_standards = Contract.where('standard_finish_date < ?', Date.today + 2.month)
    .map{|c| [
      id: c.id, 
      finish_date: c.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract_number, 
      title: c.title
    ]}   
     @no_standards = Contract.where(standard: nil)
     .map{|c| [
      id: c.id, 
      finish_date: c.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract_number, 
      title: c.title
    ]}
    @no_insurances = Contract.where(insurance: nil)
    .map{|c| [
      id: c.id, 
      finish_date: c.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract_number, 
      title: c.title
    ]}
    
    render json: {
      due_contracts: @due_contracts,
      due_insurances: @due_insurances,
      due_standards: @due_standards,
      no_standards: @no_standards,
      no_insurances: @no_insurances,
    }
  end

  def denied_services
    @denied = DenyService.where(handled: false)
    render json: @denied
  end

  def assign_user
    @denied = DenyService.find params[:deny_service_id]
    @service = Service.find @denied.service.id
    @service.user_id = params[:technician_id]
    @denied.handled = true
    @denied.save
    @service.save
    render json: @denied
  end

  def chart
    contracts = Contract.all
    @services = []
    (1..30).each do |item|
      cnt = Contract.where(service_day: item).count
      hash = {key: item, value: cnt}
      @services.push hash
    end
    render json: { services: @services.to_json }
  end
end
