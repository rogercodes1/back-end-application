class SessionsController < ApplicationController

  
  def create
     @user = User.find_by(email: params["email"])
     if (@user && @user.authenticate(params["password"]))
        render json: {
           email: @user.email,
           id: @user.id
        }
     else
        render json:{
           errors: "Credentials are incorrect, Try again."
        }, status: :unauthorized
  end

  def destroy
  end
end
