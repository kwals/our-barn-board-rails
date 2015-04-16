class RoutinesController < ApplicationController
  
  def new
    @horse = Horse.find(params[:horse_id])
  end

  def create
    @horse = Horse.find(params[:horse_id])
    @routine = @horse.routines.new(routine_params)
    if @routine.save!
      flash[:success] ="Routine saved"
      redirect_to @horse
    else
      flash[:error] = "Unable to save routine. Please try again."
      render :create
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    @horse = Horse.find(@routine.horse_id)
    flash[:success] = "You have updated #{@horse.name}'s routine."
    redirect_to @horse 
  end

  def show
    @routine = Routine.find(params[:id])
  end

private 
  def routine_params
    params.require(:routine).permit(:horse_id, :description, :kind, :created_at, :updated_at, :routine_id)
  end
end

