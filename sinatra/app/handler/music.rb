require 'json'
require_relative '../db'

module Handler
  class Music
    class << self
      def handle
        JSON.dump(data)
      end

      private

      def data
        DB[:albums].all
      end
    end
  end
end
