class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :customer, class_name: 'User'

  has_many :services
  has_many :elevators


  def self.create_services
    day = Date.today.to_pdate.day
    self.all.each do |contract|
      if day == contract.service_day
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
