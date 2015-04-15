class Twill
  T_ACCOUNT_SID = Figaro.env.T_ACCOUNT_SID
  T_AUTH_TOKEN = Figaro.env.T_AUTH_TOKEN
  KATIES_TWILIO = Figaro.env.KATIES_TWILIO

  @client = Twilio::REST::Client.new(T_ACCOUNT_SID, T_AUTH_TOKEN)

 def self.notify(complete)
  horse_name = complete.routine.horse.name
  kind = complete.routine.kind
  completer = complete.user.email.split("@")[0].capitalize
  time_completed = complete.created_at.time.getlocal
  just_time = time_completed.to_s.split(" ")[1]
  q = just_time.split(":")[0]+":"+ just_time.split(":")[1]
  completed_at = q
  user_phone = complete.routine.horse.phone_number
  
  @client.account.messages.create(
  from: KATIES_TWILIO,
  to: user_phone,
  body: "#{horse_name} was taken care of this #{kind} by #{completer} at #{completed_at}. - OurBarnBoard")
    rescue Twilio::REST::RequestError => e
      e.message
  end

  def self.alert(routine)
    horse_name = routine.horse.name
    kind = routine.kind
    user_phone = routine.horse.phone_number

    @client.account.messages.create(
    from: KATIES_TWILIO,
    to: user_phone,
    body: "#{horse_name}'s #{kind} routine has not been completed yet. - OurBarnBoard")
    rescue Twilio::REST::RequestError => e
      e.message
  end

end


 
