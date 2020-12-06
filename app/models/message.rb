class Message < ApplicationRecord
  belongs_to :to, class_name: 'User', optional: true
  enum status: [:unread, :seen]
  enum message_type: [:private_message, :customer, :technician, :everyone]
end
