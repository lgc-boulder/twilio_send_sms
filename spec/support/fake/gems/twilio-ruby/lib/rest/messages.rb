module Twilio
  module REST
    class Messages
      def create( options )
        created.push( options )
      end

      def last_created_body
        created.last.try( :[], :body )
      end

      private

      def created
        @created ||= [ ]
      end
    end
  end
end
