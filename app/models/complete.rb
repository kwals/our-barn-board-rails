class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user

  validates_presence_of :routine
  def initialize
    # This should call the function to alert the owner
  end

# This is the definition the Background Worker needs to know about 
  def self.incomplete(kind)
    # Go and see which completes have been made today. 
    todays_completes = []
      Complete.find_each do |c|
        recent = c.created_at <=> (Time.now - 6.hours)
        if recent > 0
          binding.pry
          if Routine.find(c.routine_id).kind == kind
          todays_completes.push(c.routine_id)
          end
        end
      end



    routines_to_check = Routine.where(kind: kind).pluck(:id)
    binding.pry
    routines_undone = routines_to_check - todays_completes

    unless routines_undone.nil?
      leftovers = []
      routines_undone.each {|rid| leftovers.push(Routine.find(rid))}
      return leftovers
    else
      render json: "How did you end up with nil here?"
    end

  end


end
