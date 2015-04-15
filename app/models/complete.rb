class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user
  validates_presence_of :routine

  def self.incomplete(kind)
    recent_completes = Complete.where(created_at: (Time.now - 6.hours)..Time.now)
    if recent_completes 
      undone = Routine.where(kind: kind).where.not(id: recent_completes.pluck(:routine_id)).includes(:horse)
      return undone unless undone.nil?
    elsif recent_completes.nil?
      undone = Routine.where(kind: kind).includes(:horse)
      return undone unless undone.nil?
    else
      render json: "All tasks completed!"
    end
  end


end
