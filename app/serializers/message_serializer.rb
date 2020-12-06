class MessageSerializer < ActiveModel::Serializer
  attributes :id, :to, :title, :body, :status, :message_type, :created_at  

  def message_type
    Message.message_types[object.message_type]
  end

  def to
    ActiveModelSerializers::SerializableResource.new(object.to)
  end

  def created_at
    object.created_at.to_date.to_pdate.to_s
  end
end
