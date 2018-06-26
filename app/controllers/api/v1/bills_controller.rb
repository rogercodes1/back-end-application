class Api::V1::BillsController < ApplicationController
  before_action :requires_login, only: [:index]

   def index
      # Decode with secret and the param set to true!
      # token
      # get_secret is located in teh application controller.

      render json: Bill.all
   end

   def show
      @bill = Bill.find(params[:id])
      render json: @bill
   end

   def create
      @bill = Bill.new(get_params)

      if @bill.valid?
         @bill.save
         render json: @bill
      else
         render json: { error: 'something went wrong!' }
      end
   end

   def destroy
      @bill = Bill.find(params[:id])
      @bill.destroy
      render json: { message: 'Successful Deletion' }
   end

   private

   def get_params
      params.require(:bill).permit(:date, :amount_due, :description, :user_id, :category_id)
   end
end
