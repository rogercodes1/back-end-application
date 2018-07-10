class Api::V1::UsersController < ApplicationController
  # before_action :requires_login, only: [:index]
  before_action :requires_user_match, only: [:show]

  def index
    @users = User.all
    render json: @users, include: :transactions
  end

  def create

    @user = User.new(get_params)
    @user.email = params[:email]
    @user.password = params[:password]

    if (@user.save)
      payload = {

         email: @user.email,
         id: @user.id
       }
      # IMPORTANT: set nil as password parameter
      token = JWT.encode payload, get_secret(), 'HS256'

      render json: {
        message: "You have been registed",
        token: token,
        id: @user.id
        }
    else
      render json: {
         errors: @user.errors.full_messages},
         status: :unprocessable_entity
    end
  end


  def show
    @user = User.find(params[:id])
    render json: @user, includes: [:transactions,:bills]
  end

  # def user_transactions
  #   byebug
  #   render json: @user.transactions, include: :transactions
  #
  # end

  private

  def get_params
    params.permit(:first_name, :last_name, :email, :password, :phone)
    # params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
end

# @user_transactions = Transaction.find_by(user_id: params[:id])
# if @user_transactions.user_id === get_decoded_token[0]["id"]
#   render json: @user_transactions
# else
#   render json:{
#     message: "Not your transactions",
#     status: :unauthorized}
# end
