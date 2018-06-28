class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, :first_name, :last_name, :phone, presence: true
  has_many :event_plannings
  has_many :bills
  has_many :transactions
end
