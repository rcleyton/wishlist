class UserSerializer < ActiveModel::Serializer
  has_one :favorite
  attributes :name, :email

end
