class HorsesController < ApplicationController

  def new
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save!
      # Do I put the logic for creating the events here?
      # Or should it go in the model?
      # My gut says it should be going in the model

      redirect_to @horse
    else
      binding.pry
      render json: "You f*cked up."
    end
  end

  def show
    @horse = Horse.find(params[:id])
  end

private
  def horse_params
    params.require(:horse).permit(:name, :registered_name, :birthday, :user_id, :breed, :color)
  end
end
