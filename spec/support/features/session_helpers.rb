module Features
  module SessionHelpers
    def sign_up(email, password)
      visit new_user_registration_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(email, password)
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end
  end
end