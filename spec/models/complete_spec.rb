require 'rails_helper'

RSpec.describe Complete, type: :model do
  fit "can find what completes happened today" do
    complete = FactoryGirl.create :complete, created_at: Time.now
    expect Complete.completed_today.include? complete
    #expect(Complete.completed_today).to include complete
  end

  fit "ignores completes from yesterday"
  it "does not make completes for the future"
  it "rejects impossible completes"
end
