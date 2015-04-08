class HorsesController < ApplicationController

  def index
    @horses = Horse.all
  end

  def new
    @horse ||= Horse.new
  end

  def mine
    @horses = Horse.where(user: current_user)
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
    the_results ||= []
    Routine.where(kind: 'morning').find_each do |r|
      the_results.push({'id' => r.id,
      'horse_name' => r.horse.name,
      'horse_id' => r.horse_id,
      'description' => r.description,
      'kind' => r.kind
      })
    end
    puts the_results
    render json: the_results
  end

  def show
    @horse = Horse.find(params[:id])
  end

  def edit 
    @horse = Horse.find(params[:id])
  end

  def update
    @Horse = Horse.find(params[:id])
    if @Horse.update(horse_params)
      redirect_to horse_path(@Horse)
    else
      render :edit
    end
  end

private
  def horse_params
    params.require(:horse).permit(:name, :registered_name, :birthday, :user_id, :breed, :color,:phone_number)
  end

end
