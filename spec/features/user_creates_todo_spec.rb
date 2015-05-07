require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'user creates todo' do 
    
  before do 
    @user1 = create(:user)
    login_as @user1
  end

  scenario 'succesfully' do

    visit new_todo_path

    fill_in 'Description', with: 'pay cable bill'
    click_button 'save'
    expect(page).to have_content('Item was saved')
    expect(page).to have_content('pay cable bill')
  end
end
