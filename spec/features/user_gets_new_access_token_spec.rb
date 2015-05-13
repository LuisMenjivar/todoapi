require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'user gets new access token' do 
  before do 
    @user = create(:user)
    login_as @user
  end

  scenario 'for the first time' do
    expect(@user.apikey).to eq(nil)
    visit edit_user_registration_path
    click_button 'Get An Api Key'
    expect(page).to have_content('You have succesfully created api key')
    expect(@user.reload.apikey.access_key).not_to eq(nil)
  end

  scenario 'changes access token' do
    expect(@user.apikey).to eq(nil)
    visit edit_user_registration_path
    click_button 'Get An Api Key'
    old_access_key = @user.reload.apikey.access_key
    click_button 'Change Your Api Key'
    expect(page).to have_content('You have changed your api key')
    expect(@user.apikey).not_to eq(old_access_key)
  end
end
