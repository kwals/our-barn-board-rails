class CompletesController < ApplicationController

  def create
    @routine = Routine.find(params[:routine_id])
    @horse = Horse.find(@routine.horse_id)
    # Where should I put the logic for if there is already a complete?
    @complete = @routine.completes.new(routine_id: @routine.id, user_id: current_user.id)
    if @complete.save!
      Twill.notify(@complete)
      redirect_to @horse
    else
      # This should now be a flash message
      render flash[:error] = "This did not work."
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
