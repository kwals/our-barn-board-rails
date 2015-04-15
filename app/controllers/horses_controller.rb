class HorsesController < ApplicationController

  def index
    @horses = Horse.all
  end

  def new
    @horse = Horse.new
  end

  def mine
    @horses = Horse.where(user: current_user)
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save
      flash[:success] = "Horse saved!"
      redirect_to @horse
    else
      flash[:error] ="Nope, didn't work"
      render :new
    end
  end

  def show
    @horse = Horse.find(params[:id])
  end

private
  def horse_params
    params.require(:horse).permit(:name, :registered_name, :birthday, :user_id, :breed, :color,:phone_number)
  end

end
