class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user

  validates_presence_of :routine

# How to refactor this method?
  def self.incomplete(kind)
    todays_completes = []
      Complete.find_each do |c|
        recent = c.created_at <=> (Time.now - 6.hours)
        if recent > 0
          if Routine.find(c.routine_id).kind == kind
          todays_completes.push(c.routine_id)
          end
        end
      end

    routines_to_check = Routine.where(kind: kind).pluck(:id)
    routines_undone = routines_to_check - todays_completes

    unless routines_undone.nil?
      leftovers = []
      routines_undone.each {|rid| leftovers.push(Routine.find(rid))}
      return leftovers
    else
      render json: "All tasks completed!"
    end
  end


end
