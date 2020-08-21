class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  belongs_to :customer, class_name: 'User', optional: true

  has_many :services, dependent: :destroy
  has_many :elevators, dependent: :destroy

  enum payment_type: [:cash, :cheque]

  def self.create_services
    day = Date.today.to_pdate.day
    self.all.each do |contract|
      if contract.service_day.split(",").include?(day.to_s)
        s = Service.where(
          contract: contract,
          request_type: 0,
          user: contract.user,
          status: 0,
          service_date: Date.today
        ).first_or_create


        Notify::user(s.user.firebase_token, {
          title: "سرویس جدید",
          body: "سرویس جدید",
          icon: nil
        })

        Notify::user(s.contract.customer.firebase_token, {
          title: "سرویس جدید",
          body: "سرویس ماهانه برای تعمیر و نگهداری آسانسور برای امروز ثبت شده لطفا جهت تايید یا تغییر زمان به اپلیکیشن مراجعه کنید",
          icon: nil
        })

      end
    end
  end
end
