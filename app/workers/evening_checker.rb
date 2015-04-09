class EveningChecker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(20) }

  def perform 
    routines_to_do = Complete.incomplete("evening")
    routines_to_do.each do |r|
      Twill.alert(r)
    end
  end

end