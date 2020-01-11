class ContractSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :customer_id, :title, :description,
  :start_date, :finish_date, :total_price, :address, :insurance_id, :insurance_finish_date,
   :standard_id, :standard_finish_date, :swing, :automatic, :elevator_type,
    :floors, :stops, :contract_number, :user, :customer, :service_day, :total_price

  def user
    ActiveModelSerializers::SerializableResource.new(object.user)
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer)
  end

  def start_date
    object.start_date.to_date.to_pdate.to_s
  end

  def finish_date
    object.finish_date.to_date.to_pdate.to_s
  end

  def standard_finish_date
    object.standard_finish_date.to_date.to_pdate.to_s if object.standard_finish_date
  end

  def insurance_finish_date
    object.insurance_finish_date.to_date.to_pdate.to_s if object.insurance_finish_date
  end


end
