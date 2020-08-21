class ElevatorSerializer < ActiveModel::Serializer
  attributes :id, :usage, :insurance_id, :insurance_date, :insurance_finish_date,
  :standard_id, :standard_finish_date, :swing, :automatic, :elevator_type, :floors, :stops,
  :suspension_type, :engine_room, :panel_type, :feedback, :engine_type, :car_communication,
  :capacity, :door_name, :serial_number, :panel_name, :speed, :door_type,
  :drive, :engine, :power, :insurance_date, :standard_type, :emergency_system,

  def standard_finish_date_shamsi
    object.standard_finish_date.to_date.to_pdate.to_s unless object.standard_finish_date.nil?
  end

  def insurance_date_shamsi
    object.insurance_date.to_date.to_pdate.to_s unless object.insurance_date.nil?
  end

  def insurance_finish_date_shamsi
    object.insurance_finish_date.to_date.to_pdate.to_s unless object.insurance_finish_date.nil?
  end

  def elevator_type
    Elevator.elevator_types[object.elevator_type]
  end

  def door_type
    Elevator.door_types[object.door_type]
  end

  def usage
    Elevator.usages[object.usage]
  end

  def suspension_type
    Elevator.suspension_types[object.suspension_type]
  end

  def emergency_system
    Elevator.emergency_systems[object.emergency_system]
  end

  def engine_room
    Elevator.engine_rooms[object.engine_room]
  end

  def panel_type
    Elevator.panel_types[object.panel_type]
  end

  def feedback
    Elevator.feedbacks[object.feedback]
  end

  def engine_type
    Elevator.engine_types[object.engine_type]
  end

  def car_communication
    Elevator.car_communications[object.car_communication]
  end

  def standard_type
    Elevator.standard_types[object.standard_type]
  end
end
