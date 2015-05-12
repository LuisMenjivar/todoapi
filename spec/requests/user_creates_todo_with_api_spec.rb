require 'rails_helper'
describe "get index request " do 
  before(:example) do |example|
    @user = create(:user, email: "test@example.com")
    @apikey = Apikey.create(user: @user, access_key: SecureRandom.hex)
  end
  it "get index of all todo items" do
    # get '/api/v1/todos' {}
    get '/api/v1/todos', nil, {'HTTP_AUTHORIZATION' => @apikey.access_key }
    expect(response.status).to eq(200) 
  end
end
