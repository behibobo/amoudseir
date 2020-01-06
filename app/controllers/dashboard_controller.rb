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

    render json: {
      today_services: ActiveModelSerializers::SerializableResource.new(@today_services),
      tomorrow_services: ActiveModelSerializers::SerializableResource.new(@tomorrow_services),
      today: today.to_s,
      tomorrow: tomorrow.to_s,
      charts: charts
    }
  end

  def denied_services
    @denied = DenyService.where(handled: false)
    render json: @denied
  end

  def assign_user
    @denied = DenyService.find params[:deny_service_id]
    @service = service.find @denied.service.id
    @service.user_id = params[:technician_id]
    @denied.handled = true
    @denied.save
    @servcie.save
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
