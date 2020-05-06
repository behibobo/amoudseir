class DashboardController < ApplicationController
  skip_before_action :authenticate_request, only: %i[pusher]

  def index
    today = Date.today
    tomorrow = Date.tomorrow

    @today_services = Service.where(service_date: today)
    @tomorrow_services = Service.where(service_date: tomorrow)

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
      hash = {id: r.id, contract_id: r.contract.id, building_number: r.contract.building_number, lat: r.contract.lat, lng: r.contract.lng}
      repair_services.push(hash)
    end

    monthly = Service.where(status: :open).where(request_type: :monthly)
    monthly_services = []

    monthly.each do |r|
      hash = {id: r.id, contract_id: r.contract.id, building_number: r.contract.building_number, lat: r.contract.lat, lng: r.contract.lng}
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
      building_number: c.building_number
    ]}

    @due_insurances =  Elevator.where('insurance_finish_date < ?', Date.today + 1.month)
    .map {|c| [
      id: c.contract.id, 
      finish_date: c.contract.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract.contract_number, 
      building_number: c.contract.building_number
    ]}

    @due_standards = Elevator.where('standard_finish_date < ?', Date.today + 1.month)
    .map{|c| [
      id: c.contract.id, 
      finish_date: c.contract.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract.contract_number, 
      building_number: c.contract.building_number
    ]}   
     @no_standards = Elevator.where(standard: nil)
     .map{|c| [
       id: c.contract.id, 
       finish_date: c.contract.finish_date.to_date.to_pdate.to_s, 
       contract_number: c.contract.contract_number, 
       building_number: c.contract.building_number
     ]}  
    @no_insurances = Elevator.where(insurance: nil)
    .map{|c| [
      id: c.contract.id, 
      finish_date: c.contract.finish_date.to_date.to_pdate.to_s, 
      contract_number: c.contract.contract_number, 
      building_number: c.contract.building_number
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

  def pusher
    fcm = FCM.new('AAAApe0tnzk:APA91bFppdbmBNvhPKgBHlJTl7Tg041ZtsYOt6wAgQlfz8g39WdBle_7C7A2JQ4T1pAlE2mXHeG7OkslWMBGABOPvqToZQos_wFMlHXAb_N3oL-QSLmdhX5Ytqqat72pE_ayyPXVdK3U')

registration_ids= ["eyTRyo0UypUsa0oiwm3I2Y:APA91bE8QXraqX6C0zCFlpLnCfgKUPQ_EPrdDmimoHeXfyoDQsUl5Ul8sXwkKgmTgShixS_j7K2aXDB5fooTR25DcbhyR5LvuQGb72C6i0q5_Zd7p3GV-butRcP1IjHZrmoMPS4oCsVx"] 

options = {
        priority: "high",
        collapse_key: "updated_score", 
        notification: {
            title: "Message Title", 
            body: "Hi, Worked perfectly",
            icon: "myicon"}
        }

response = fcm.send(registration_ids, options)
  end
end
