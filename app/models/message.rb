class Message < ApplicationRecord
  belongs_to :to, class_name: 'User', optional: true
  has_one :message_status
  enum message_type: [:private_message, :customer, :technician, :everyone]
end
