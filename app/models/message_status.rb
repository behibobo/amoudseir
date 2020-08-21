class MessageStatus < ApplicationRecord
  belongs_to :user
  belongs_to :message
  enum status: [:unread, :seen]

end
