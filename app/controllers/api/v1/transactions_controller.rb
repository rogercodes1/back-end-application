class Api::V1::TransactionsController < ApplicationController
   before_action :requires_login, only: [:index, :user_transactions]

   def index
      @transactions = Transaction.all
      byebug
      render json: @transactions
   end

   def create
      byebug
      @transaction = Transaction.new(get_params)
      byebug
      if @transaction.save
         render json: @transaction
      else
         render json: { error: 'something went wrong!' }
      end
   end

   def user_transactions
     @user_transactions = Transaction.all.find_by(user_id: params[:user_id])
     byebug
     if @user_transactions = get_decoded_token[0]["id"]
       render json: @user_transactions
     else
       render json:{
         message: "Not your transactions",
         status: :unauthorized}
       }
   end

   private

   def get_params
      params.require(:transaction).permit(
        :amount,
        :date,
        :description,
        :transaction_type,
        :user_id,
        :category_id)
   end
end
