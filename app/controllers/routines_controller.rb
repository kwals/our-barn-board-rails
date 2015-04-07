class RoutinesController < ApplicationController
  
  def new
    @horse = Horse.find(params[:horse_id])
  end

  def create
    @horse = Horse.find(params[:horse_id])
    @routine = @horse.routines.new(routine_params)
    if @routine.save!
      redirect_to @horse
    else
      render json: "That didn't work."
    end
  end

  def show
    @routine = Routine.find(params[:id])
  end

  # def testaction(params)
  #   @routine = Routine.find(params[:routine_id])
  #   @routine.completes.create(params[:routine_id])
  #   render json: "You did it."
  # end

private 
  def routine_params
    params.require(:routine).permit(:horse_id, :description, :kind, :created_at, :updated_at, :routine_id)
  end
end

