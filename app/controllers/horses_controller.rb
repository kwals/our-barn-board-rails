class HorsesController < ApplicationController

  def new
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save!
      redirect_to @horse
    else
      render json: "This did not work."
    end
  end

  def testaction
    render json: {"Horses" => "War Admiral", "Owner" => "Bob"}
  end

  def show
    @horse = Horse.find(params[:id])
  end

private
  def horse_params
    params.require(:horse).permit(:name, :registered_name, :birthday, :user_id, :breed, :color)
  end

end
