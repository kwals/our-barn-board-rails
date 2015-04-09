class Api::CompletesController < ApplicationController
# For APIs, you may want to use  instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    render json: "Test"
  end

  def create
    @routine = Routine.find(params[:routine_id])
    @horse = Horse.find(@routine.horse_id)
    @complete = @routine.completes.new(routine_id: @routine.id, user_id: 1)
    if @complete.save!
      Twill.notify(@complete)
      render :json => "Thanks for feeding #{@horse.name}" 
    else
      # Do I need to rescue from errors here?
      render json: "Nope, no dice."
      head 500
    end
  end

private
  def complete_params
    params.require(:complete).permit(:routine_id, :completed_at, :user_id, :notes)
  end
end