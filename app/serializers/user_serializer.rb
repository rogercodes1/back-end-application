class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone, :email

  has_many :transactions
  has_many :bills
  has_many :event_plannings
end
