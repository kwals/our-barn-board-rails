class MorningChecker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(11) }

  def perform 
    routines_to_do = Complete.incomplete("morning")
    routines_to_do.each do |r|
      Twill.alert(r)
    end
  end

end