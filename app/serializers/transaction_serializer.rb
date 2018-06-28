class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :description, :category_id, :user_id, :transaction_type

  belongs_to :user
end
