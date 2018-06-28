class Bill < ApplicationRecord
  validates :date, :amount_due, :description, :user_id,:category_id, presence: true

  belongs_to :user
  belongs_to :category
end
