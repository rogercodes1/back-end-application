class SessionsController < ApplicationController


  def create
     @user = User.find_by(email: params["email"])
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
#
# create_table "users", force: :cascade do |t|
#   t.string "first_name", null: false
#   t.string "last_name", null: false
#   t.string "email", null: false
#   t.string "password_digest", null: false
#   t.date "birthday", null: false
#   t.string "gender", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
