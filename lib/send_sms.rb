require_relative 'order'
require 'twilio-ruby'

class Message

  def food_summary
    @summary = OrderProcess.new.customer_order_summary
  end

  def confirmation_text

    account_sid = 'AC434407bd7130d35abe9799d542f94116'
    auth_token = 'c95e989cf07855de0747bd4a32a117bf'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12513579138' # Your Twilio number
    to = '+447912212181' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order of from Costa Del Oval. It will arrive #{(Time.new + 3600).strftime("%k:%M")}"
    )
  end
end

