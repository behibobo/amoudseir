class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :customer, class_name: 'User'
  belongs_to :standard
  belongs_to :insurance

  has_many :services
end
