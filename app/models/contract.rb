class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  belongs_to :customer, class_name: 'User', optional: true

  has_many :services, dependent: :destroy
  has_many :elevators, dependent: :destroy

  validates :contract_number, uniqueness: true

  enum payment_type: [:cash, :cheque]
  enum status: [:active, :archived]

  def self.create_services(tomorrow=false)
    
    puhser = PusherHelper::get_object
    
    day = tomorrow ? Date.tomorrow.to_pdate.day : Date.today.to_pdate.day
    
    self.all.each do |contract|
      if contract.service_day.split(",").include?(day.to_s)
        s = Service.where(
          contract: contract,
          request_type: 0,
          user: contract.user,
          status: 0,
          service_date: tomorrow ? Date.tomorrow : Date.today
        ).first_or_create

        
        user_id = contract.user.id.to_s
        customer_id = contract.customer.id.to_s
        

        pusher.trigger(user_id, 'event', message: {
          title: "سرویس جدید",
          body: "سرویس جدید",
          icon: nil
        })
        pusher.trigger(customer_id, 'event', message: {
            title: "سرویس جدید",
            body: "سرویس جدید",
            icon: nil
          })

      end
    end
  end
end
