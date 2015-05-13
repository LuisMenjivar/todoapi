class ApikeyController < ApplicationController 
  def create
    if current_user.apikey
      current_user.apikey.update_attributes(access_key: SecureRandom.hex)
      redirect_to edit_user_registration_path, notice: 'You have changed your api key'
    else
      current_user_access_token = Apikey.new(user: current_user, access_key: SecureRandom.hex)
      if current_user_access_token.save
        redirect_to edit_user_registration_path, notice: 'You have succesfully created api key' 
      else
        redirect_to edit_user_registration_path, notice:'an error has ecurred' 
      end
    end
  end
end