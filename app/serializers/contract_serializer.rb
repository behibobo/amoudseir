class ContractSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :customer_id, :building_number, :description,
  :start_date, :finish_date, :total_price, :address, :payment_type, :stops,
  :start_date_shamsi , :finish_date_shamsi, :service_dept,
     :contract_number, :service_day,  :lat, :lng, :elevators, :dept

  belongs_to :user, serializer: SingleUserSerializer
  belongs_to :customer,  serializer: SingleUserSerializer

  def elevators
    ActiveModelSerializers::SerializableResource.new(object.elevators)
  end

  def payment_type
    Contract.payment_types[object.payment_type]
  end


  def start_date_shamsi
    object.start_date_shamsi
  end

  def finish_date_shamsi
    object.finish_date_shamsi
  end
    
  def service_dept
    object.service_dept
  end
end
