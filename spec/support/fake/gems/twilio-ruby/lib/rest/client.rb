module Twilio
  module REST
    class Client
      def initialize( account_sid = nil, auth_token = nil )
      end

      def messages
        @messages ||= Twilio::REST::Messages.new
      end

      def last_sent_message_body
        messages.last_created_body
      end
    end
  end
end
