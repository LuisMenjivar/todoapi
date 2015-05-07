require 'rails_helper'

RSpec.describe Todo, :type => :model do
  

  context "associations" do

    it "belongs to user" do
      expect(Todo.new).to belong_to(:user)
    end

  end

  context "validations" do
    it "ensures description is at least 5 characters" do
      expect(Todo.new).to ensure_length_of(:description).is_at_least(5)
    end
  end
end

