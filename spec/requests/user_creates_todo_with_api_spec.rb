require 'rails_helper'
describe "get index request " do 
  before(:example) do |example|
    @user = create(:user, email: "test@example.com")
    @apikey = Apikey.create(user: @user)
  end
  it "get index of all his todo items" do
    get '/api/v1/todos'
    expect(response.status).to eq(200) 
  end
end
