require 'rails_helper'
require 'rake'
describe "delete_items rake task " do 
  before :all do
    Rake.application.rake_require "tasks/sevendays"
    Rake::Task.define_task(:environment)
  end
  it "deletes todos after seven days from creation day" do 
    todo1 = Todo.create(user_id: 1, description: "this is a valid description", created_at: "2014-01-14 02:01:05")
    expect(Todo.all.count).to eql(1)
    expect(todo1.reload.persisted?).to eql(true)
    Rake::Task['delete_items'].invoke
    expect(Todo.all.count).to eql(0)
    expect{todo1.reload.persisted?}.to raise_error(ActiveRecord::RecordNotFound)
    
  end

end
