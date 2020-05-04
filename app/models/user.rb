class User < ApplicationRecord
  #Validations
  validates_presence_of :first_name, :last_name, :username, :password_digest
  validates :username, uniqueness: true

  enum role: [:admin, :technician, :customer]
  enum status: [:active, :inactive]
  enum gender: [:male, :female]

  has_many :customer_contracts, foreign_key: "customer_id", class_name: "Contract", dependent: :destroy
  has_many :technician_contracts, foreign_key: "user_id", class_name: "Contract", dependent: :destroy
  has_many :messages, foreign_key: "to_id", class_name: "Message", dependent: :destroy
  has_many :services, foreign_key: "user_id", class_name: "Service", dependent: :destroy
  #encrypt password
  has_secure_password

  def full_name
     "#{self.first_name} #{self.last_name}"
  end

end
