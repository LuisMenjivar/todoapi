require 'rails_helper'

describe ApplicationHelper do 
  describe "days_left_to_complete" do 
    it "starts a countdown of seven days" do 
      @todo = create(:todo)
      expect(helper.days_left_to_complete(@todo)).to eq("You have 6 days and 23 hours to complete this task")
    end
  end
end