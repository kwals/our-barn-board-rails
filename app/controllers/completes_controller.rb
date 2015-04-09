class CompletesController < ApplicationController

 # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def create
    @routine = Routine.find(params[:routine_id])
    @horse = Horse.find(@routine.horse_id)
    @complete = @routine.completes.new(routine_id: @routine.id, user_id: current_user.id)
    if @complete.save!
      Twill.notify(@horse.phone_number)
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
