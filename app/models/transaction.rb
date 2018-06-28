class Transaction < ApplicationRecord
  validates :date, :amount, :description, :transaction_type,:user_id,:category_id, presence: true

  belongs_to :user
  belongs_to :category

end
