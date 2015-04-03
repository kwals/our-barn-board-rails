class CompletesController < ApplicationController

  def index
  end

  def new
  end

  def create
    @routine = Routine.find(params[:routine_id])
    @horse = Horse.find(params[:horse_id])
    @complete = @routine.completes.new(routine_id: @routine.id, user_id: current_user.id)
    if @complete.save!
      redirect_to @horse
    else
      render json: "Nope, no dice."
    end
  end

  def show
    @complete = Complete.find(params[:id])
  end


private
  def complete_params
    params.require(:complete).permit(:routine_id, :completed_at, :user_id, :notes)
  end
end
