class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :request_type, :status, :user, :created_at, :customer, :contract, :items, :parts, :service_items, :total_price, :part_price, :service_price

  def user
    ActiveModelSerializers::SerializableResource.new(object.user)
  end

  def items
    object.items.pluck(:id)
  end

  def service_items
    object.items
  end

  def parts
    object.service_parts
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.contract.customer)
  end

  def status
    Service.statuses[object.status]
  end

  def contract
    ActiveModelSerializers::SerializableResource.new(object.contract)
  end

  def request_type
    Service.request_types[object.request_type]
  end

  def created_at
    object.created_at.to_date.to_pdate.to_s
  end

  def service_price
    (object.contract.total_price / 12)
  end

  def part_price
    part_price = 0
    object.service_parts.each do |part|
      part_price += (part.price * part.qty)
    end
    return part_price
  end

  def total_price
    total_price = 0
    object.service_parts.each do |part|
      total_price += (part.price * part.qty)
    end
    total_price += (object.contract.total_price / 12)
    return total_price
  end
end
