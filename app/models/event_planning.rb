class EventPlanning < ApplicationRecord
  validates :date, :name, :current_savings, :user_id,:goal_amount, presence: true

  belongs_to :user
end
