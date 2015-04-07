class HorsesController < ApplicationController

  def new
  end

  def create
    @horse = current_user.horses.new(horse_params)
    if @horse.save!
      redirect_to @horse
    else
      render json: ["This did not work."]
    end
  end

  def testaction
    render json:  [{'horse_id' => 2, 
      'horse_name' => 'Henry',
      'description' => 'One flake of alfalfa hay with two scoops of grain',
      'kind' => 'morning'},
      {'horse_id' => 3,
      'horse_name' => 'Ruby',
      'description' => 'One flake of regular hay, no grain.',
      'kind' => 'morning'},
      {'horse_id' => 6,
      'horse_name' => 'Charlie',
      'description' => 'Put out into field.',
      'kind' => 'morning'}]
  end

  def show
    @horse = Horse.find(params[:id])
  end

private
  def horse_params
    params.require(:horse).permit(:name, :registered_name, :birthday, :user_id, :breed, :color,:phone_number)
  end

end
