class Api::RoutinesController < ApplicationController
  skip_before_action protect_from_forgery with: :exception 
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def index
    if Time.now.hour <= 12 #THIS IS LOCALTIME
      @tasks = Complete.incomplete("morning")
    elsif Time.now.hour > 12  #THIS IS LOCALTIME
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
      'horse_name' => r.horse.name,
      'horse_id' => r.horse_id,
      'description' => r.description,
      'kind' => r.kind,
      'phone_number' => r.horse.phone_number
      })
    end
    the_results
  end

private 
  def routine_params
    params.require(:routine).permit(:horse_id, :description, :kind, :created_at, :updated_at, :routine_id)
  end
end