class ServiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :service
end
