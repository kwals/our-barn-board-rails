class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user

  validates_presence_of :routine

  def self.completed_today(kind)
    # Go and see which completes have been made today. 
    todays_completes = Completes.where(:created_at > (Time.now - 6.hours))
    routines_done = todays_completes.pluck(:routine_id)

    routines_to_check = Routine.where(kind: kind).pluck(:id)
    routines_undone = routines_done - routines_to_check
    
    unless routines_undone.nil?
      return routines_undone
    else
      render json: "All set."
    end

  end


end
