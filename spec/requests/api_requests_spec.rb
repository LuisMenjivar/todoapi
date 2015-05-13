require 'rails_helper'
describe "get index request " do 
  before(:example) do |example|
    @user = create(:user)
    @apikey = Apikey.create(user: @user, access_key: SecureRandom.hex)
  end
  it "creates a todo" do 
    post '/api/v1/todos/?todo[description]="hello world"', nil, {'HTTP_AUTHORIZATION' => "Token token=#{@apikey.access_key}"}
    expect(response.status).to eq(201)
    expect(@user.todos.count).to eq(1)
  end
  it "gets a list of todo items" do
    todo = create(:todo, description: "helloworld", user: @user, id: 1)
    expect(@user.todos.count).to eq(1)
    get '/api/v1/todos', nil, {'HTTP_AUTHORIZATION' => "Token token=#{@apikey.access_key}"}
    expect(response.status).to eq(200) 
    expect(response.body).to eq(@user.todos.to_json)
    json_response = response.body
  end
  it "deletes a todo" do
    todo = create(:todo, description: "helloworld", user: @user, id: 1)
    expect(@user.todos.count).to eq(1)
    delete '/api/v1/todos/1', nil, {'HTTP_AUTHORIZATION' => "Token token=#{@apikey.access_key}"}
    expect(response.status) .to eq(202)
    expect(@user.todos.count).to eq(0)
  end
end
