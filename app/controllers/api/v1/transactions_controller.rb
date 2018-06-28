class Api::V1::TransactionsController < ApplicationController
   before_action :requires_login, only: [:index]
   # before_action :user_transactions, only: [:index]

   def index
      @transactions = Transaction.all
      render json: @transactions
   end

   def create
      @transaction = Transaction.new(get_params)
      byebug
      if @transaction.save
         render json: @transaction
      else
         render json: { error: 'Transactions, something went wrong!' }
      end

   end
   def show


   end


   end

   private

   def get_params
      params.permit(
        :amount,
        :date,
        :description,
        :transaction_type,
        :user_id,
        :category_id)
        # this should be represented as the bottom, but I am testing on postman
        # params.require(:transaction).permit(
        #   :amount,
        #   :date,
        #   :description,
        #   :transaction_type,
        #   :user_id,
        #   :category_id)
   end

end
