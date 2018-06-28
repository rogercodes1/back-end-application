class Category < ApplicationRecord

  has_many :transactions
  has_many :bills

end
