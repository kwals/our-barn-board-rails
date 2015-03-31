require 'rails_helper'

RSpec.describe RoutineController, type: :controller do
  it "allows users to update routines of horses the user owns"
  it "does not allow users to update rountines of horses they don't own"
  it "allows users to view all routines"
end
