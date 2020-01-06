class CustomerTransaction < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :contract

  enum payment_type: [:cash, :transfer, :online]

end
