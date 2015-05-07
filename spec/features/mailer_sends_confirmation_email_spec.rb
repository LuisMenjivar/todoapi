require 'rails_helper'

feature "sign up" do 
  let(:user) { build(:user) }
  scenario "For Luis Todo list" do 
    reset_mailer
    sign_up(user.email, user.password)
    expect(page).to have_text("A message with a confirmation link has been sent to your email address ")
    expect(unread_emails_for(user.email).count).to eq(1)
    open_email(user.email)
    expect(current_email).to have_body_text("You can confirm your account email through the link below")
    click_first_link_in_email
    expect(page).to have_content('Your email address has been successfully confirmed')
    sign_in(user.email, user.password)
    expect(page).to have_text("Sign out")
  end
  end

  
