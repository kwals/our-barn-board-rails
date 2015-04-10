class Api::RoutinesController < ApiController

  def index
    if Time.now.hour < 12 #THIS IS LOCALTIME
      @tasks = Complete.incomplete("morning")
    elsif Time.now.hour > 16 #THIS IS LOCALTIME
      @tasks = Complete.incomplete("evening")
    else
      render json: "There are no tasks at this time."
      return
    end

    the_results = get_results(@tasks)

    render json: the_results
  end

  def get_results(tasks)
    the_results ||= []
    @tasks.each do |r|
      the_results.push({'id' => r.id,
      # 'horse_name' => r.horse.name,
      # 'horse_id' => r.horse_id,
      'description' => r.description,
      'kind' => r.kind,
      # 'phone_number' => r.phone_number
      })
    end
    the_results
  end

private 
  def routine_params
    params.require(:routine).permit(:horse_id, :description, :kind, :created_at, :updated_at, :routine_id)
  end
end