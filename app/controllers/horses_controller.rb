class HorsesController < ApplicationController

  class HorsesController < ApplicationController

  def new
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save!
      redirect_to @horse
    else
      binding.pry
      render json: "This did not work."
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

end
