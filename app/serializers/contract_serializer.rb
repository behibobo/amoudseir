class ContractSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :customer_id, :building_number, :description,
  :start_date, :finish_date, :total_price, :address, :payment_type, :stops,
     :contract_number, :user, :customer, :service_day,  :lat, :lng

  has_many :elevators

  def user
    ActiveModelSerializers::SerializableResource.new(object.user)
  end

  def payment_type
    Contract.payment_types[object.payment_type]
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer)
  end

  def start_date_shamsi
    object.start_date.to_date.to_pdate.to_s
  end

  def finish_date_shamsi
    object.finish_date.to_date.to_pdate.to_s
  end

  
  
end
