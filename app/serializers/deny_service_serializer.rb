class DenyServiceSerializer < ActiveModel::Serializer
  attributes :id, :service, :deny_reason, :created_at

  def service
    ActiveModelSerializers::SerializableResource.new(object.service)
  end

  def deny_reason
    ActiveModelSerializers::SerializableResource.new(object.deny_reason)
  end

  def created_at
    object.created_at.to_date.to_pdate.to_s
  end
end
