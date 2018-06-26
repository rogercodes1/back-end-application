class ApplicationController < ActionController::Base
   protect_from_forgery with: :null_session

   def get_secret
      ENV['JWT_SECRET']
    end

   def get_token
      request.headers['Authorization']
   end

   # auth tons of routes really quickly  1:36
   def get_decoded_token
     token = get_token()
      begin
         decoded_token = JWT.decode token, get_secret, true, algorithm: 'HS256'
      rescue JWT::DecodeError
         nil
      end
      decoded_token
   end

   def is_authenticated?
      !!get_decoded_token
   end


  def requires_login
    if !is_authenticated?
      render json: {
         message: 'No Auth',
         status: :unauthorized}

    else


    end

  end




end
