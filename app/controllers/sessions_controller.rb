class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params["email"])
    if (@user && @user.authenticate(params["password"]))
     token = generate_token

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
