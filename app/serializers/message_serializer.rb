class MessageSerializer < ActiveModel::Serializer
  attributes :id, :to, :title, :body, :status, :message_type, :created_at

  def status
    MessageStatus.statuses[object.message_status.status]
  end

  def to
    object.to.full_name
  end

  def created_at
    object.created_at.to_date.to_pdate.to_s
  end
end
