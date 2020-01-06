class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :role, :full_name, :cell

  def role
    User.roles[object.role]
  end

  def full_name
    object.full_name
  end
end
