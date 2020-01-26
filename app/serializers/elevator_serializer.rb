class ElevatorSerializer < ActiveModel::Serializer
  attributes :id :usage, :insurance_id, :insurance_date, :insurance_finish_date,
  :standard_id, :standard_finish_date, :swing, :automatic, :elevator_type, :floors, :stops,
  :suspension_type, :engine_room, :panel_type, :feedback, :engine_type, :car_communication,
  :capacity, :door_name, :serial_number, :panel_name, :speed
  :drive, :engine, :power, :insurance_date, :standard_type,

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

  def suspension_type
    Contract.suspension_types[object.suspension_type]
  end

  def speed
    Contract.speeds[object.speed]
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

  def standard_type
    Contract.standard_types[object.standard_type]
  end
end
