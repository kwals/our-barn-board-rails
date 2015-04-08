class CompletesController < ApplicationController

  def index
  end

  def new
  end

  def create
    binding.pry
    @routine = Routine.find(params[:routine_id])
    @horse = Horse.find(@routine.horse_id)
    @complete = @routine.completes.new(routine_id: @routine.id, user_id: 1)
    if @complete.save!
      Twill.notify(@horse.phone_number)
      respond_to do |format|
      format.html { render @horse }
      format.json  { render :json => "Thanks for feeding #{@horse.name}" }
      end
    else
      render json: "Nope, no dice."
      head 500
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
