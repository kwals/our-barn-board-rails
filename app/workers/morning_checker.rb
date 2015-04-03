class MorningChecker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { secondly }

  def perform 
    # Check completed vs. not
    puts "This is where my logic will go."
  end
end