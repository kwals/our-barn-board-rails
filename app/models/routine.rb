class Routine < ActiveRecord::Base
  belongs_to :horse
  has_many :completes

  morning_due_time = 11
  evening_due_time = 21

  def new
  end

  def create(params)
    # I want to have a hidden value that send along the id of horse's page that we are on.
    if params(:kind) == "morning"
      self.due = morning_due_time
    elsif params(:kind) =="evening"
      self.due = evening_due_time
    else
      render json: "That's not an option."
    end
  end


  def self.check_all
    # Iterate through completes
  end

end
