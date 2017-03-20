require 'twilio-ruby'

class TwilioSendSms
  def self.send_sms(options)
    @options = options

    create_client

    create_message
  end

  private

  def self.create_client
    @client = Twilio::REST::Client.new(
      @options[ :account_sid ],
      @options[ :auth_token ] 
    )
  end

  def self.create_message
    @client.messages.create(
      from: @options[ :message_from ],
      to: @options[ :message_to ],
      body: @options[ :message_body ]
    )
  end
end
