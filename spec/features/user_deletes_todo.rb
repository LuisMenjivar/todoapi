require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "user deletes a todo from index view" do 

  before do 
    @user = create(:user)
    login_as @user
    @todo = create(:todo, user: @user)
  end

  it "deletes a todo when clicking complete button" do
    
    visit todos_path

    click_button "Completed"
    expect(page).to have_content('Todo was deleted')
  end 
end




