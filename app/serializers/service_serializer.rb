class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :request_type, :status, :created_at, :user_name, :user_cell, :customer_name, :customer_cell, :total_price, :part_price, :service_price, :service_date

  belongs_to :contract
  belongs_to :reason
  has_many :items
  has_many :service_parts

  def customer_name
    object.contract.customer.full_name
  end

  def customer_cell
    object.contract.customer.cell
  end

  def user_name
    object.user.full_name
  end

  def user_cell
    object.user.cell
  end
  

  def status
    Service.statuses[object.status]
  end


  def request_type
    Service.request_types[object.request_type]
  end

  def created_at
    object.created_at.to_date.to_pdate.to_s
  end

  def created_date
    object.created_date.to_date.to_pdate.to_s
  end

  def service_date
    object.service_date.to_date.to_pdate.to_s
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
