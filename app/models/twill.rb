class Twill
  T_ACCOUNT_SID = Figaro.env.T_ACCOUNT_SID
  T_AUTH_TOKEN = Figaro.env.T_AUTH_TOKEN
  KATIES_TWILIO = Figaro.env.KATIES_TWILIO

  @client = Twilio::REST::Client.new(T_ACCOUNT_SID, T_AUTH_TOKEN)

 def self.notify(params)
  horse_name = 'Ruby'
  kind = 'morning'
  completer = 'Sherri'
  completed_at = '8 am'
  user_phone = params
  @client.account.messages.create(
  from: KATIES_TWILIO,
  to: params,
  body: "#{horse_name} was taken care of this #{kind} by #{completer} at #{completed_at}. - OurBarnBoard")
    rescue Twilio::REST::RequestError => e
      e.message
  end

end


 
