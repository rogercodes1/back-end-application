class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    byebug
    render json: @users
  end

  def create
    @user = User.new(get_params)
    @user.email = params[:email]
    @user.password = params[:password]
    byebug
    if (@user.save)
      payload = {
         email: @user.email,
         id: @user.id
       }
      # IMPORTANT: set nil as password parameter
      token = JWT.encode payload, get_secret(), 'HS256'

      render json: {
        message: "You have been registed",
        token: token

        }
    else
      render json: {
         errors: @user.errors.full_messages},
         status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.permit(:first_name, :last_name, :email, :password, :phone)
    # params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)

  end
end
