require 'uri'
require 'net/http'

module Handler
  class Planets
    URL = 'http://swapi.co/api/planets/?format=json'

    class << self
      def handle
        data.body
      end

      private

      def data
        Net::HTTP.get_response(url)
      end

      def url
        @url ||= URI(URL)
      end
    end
  end
end
