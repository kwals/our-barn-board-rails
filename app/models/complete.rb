class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user

  validates_presence_of :routine

  def self.completed_today(kind)
    # Go and see which completes have been made today. 
    todays_completes = []
      Complete.find_each do |c|
        recent = c.created_at <=> (Time.now - 6.hours)
        if recent > 0
          if Routine.find(c.routine_id).kind == kind
            binding.pry
          todays_completes.push(c)
          end
        end
      end

    routines_done = []
    todays_completes.each {|c| routines_done.push(c.routine_id)}
    binding.pry
    routines_to_check = Routine.where(kind: kind).pluck(:id)
    binding.pry
    routines_undone = routines_done - routines_to_check
    binding.pry
    
    unless routines_undone.nil?
      return routines_undone
    else
      render json: "All set."
    end

  end


end
