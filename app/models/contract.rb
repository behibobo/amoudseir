class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  belongs_to :customer, class_name: 'User', optional: true

  has_many :services
  has_many :elevators, dependent: :destroy

  enum payment_type: [:cash, :cheque]

  def self.create_services
    day = Date.today.to_pdate.day
    self.all.each do |contract|
      if contract.service_day.split(",").include?(day.to_s)
        Service.where(
          contract: contract,
          request_type: 0,
          user: contract.user,
          status: 0
        ).first_or_create
      end
    end
  end
end
