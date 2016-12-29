require 'json'

module Handler
  class Music
    class << self
      def handle
        data.to_json
      end

      private

      def data
        DB[:albums].all
      end
    end
  end
end
