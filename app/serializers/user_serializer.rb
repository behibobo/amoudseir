class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :role, :full_name, :cell, :gender, :firebase_token, :customer_contracts


  def customer_contracts
    object.customer_contracts
  end

  def role
    User.roles[object.role]
  end

  def gender
    User.genders[object.gender]
  end

  def full_name
    object.full_name
  end
end
