class ContractSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :customer_id, :title, :description,
  :start_date, :finish_date, :total_price, :address, :insurance_id, :insurance_date, :insurance_finish_date,
   :standard_id, :standard_finish_date, :swing, :automatic, :elevator_type,
    :floors, :stops, :contract_number, :user, :customer, :service_day, :total_price, :usage,
    :towing_wire, :engine_room, :panel_type, :feedback, :engine_type, :car_communication,
    :capacity, :automatic_door_name, :serial_number, :panel_name,
    :drive, :engine, :power, :insurance_date, :insurance_type

  def user
    ActiveModelSerializers::SerializableResource.new(object.user)
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

  def standard_finish_date_shamsi
    object.standard_finish_date.to_date.to_pdate.to_s if object.standard_finish_date
  end

  def insurance_date_shamsi
    object.insurance_date.to_date.to_pdate.to_s if object.insurance_date
  end

  def insurance_finish_date_shamsi
    object.insurance_finish_date.to_date.to_pdate.to_s if object.insurance_finish_date
  end

  def elevator_type
    Contract.elevator_types[object.elevator_type]
  end

  def usage
    Contract.usages[object.usage]
  end

  def towing_wire
    Contract.towing_wires[object.towing_wire]
  end

  def engine_room
    Contract.engine_rooms[object.engine_room]
  end

  def panel_type
    Contract.panel_types[object.panel_type]
  end

  def feedback
    Contract.feedbacks[object.feedback]
  end

  def engine_type
    Contract.engine_types[object.engine_type]
  end

  def car_communication
    Contract.car_communications[object.car_communication]
  end

  def insurance_type
    Contract.insurance_types[object.insurance_type]
  end
  
end
