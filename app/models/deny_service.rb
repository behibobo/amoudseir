class DenyService < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :deny_reason
end
