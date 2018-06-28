class BillSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount_due, :user_id, :descrioption, :category_id
end
