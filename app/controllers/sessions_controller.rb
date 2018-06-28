class SessionsController < ApplicationController


  def create
    byebug
     @user = User.find_by(email: params["email"])
     byebug
     if (@user && @user.authenticate(params["password"]))
       payload = {
         email: @user.email,
         id: @user.id
       }
       token = JWT.encode payload, get_secret(), 'HS256'

        render json: {
           email: @user.email,
           id: @user.id,
           token: token
         }
       else

        render json:{
           errors: "Credentials are incorrect, Try again."
        }, status: :unauthorized
     end
  end

  def destroy
  end

end
