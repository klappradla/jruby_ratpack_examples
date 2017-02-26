java_import 'ratpack.http.client.HttpClient'

module Handler
  class Planets
    URL = java.net.URI.new(ENV['PLANETS_URL'] || 'http://swapi.co/api/planets')

    class << self
      def handle(ctx)
        @ctx = ctx
        get_planets
      end

      private

      def get_planets
        @ctx
          .get(HttpClient.java_class)
          .get(URL)
          .map  { |resp| resp.get_body }
          .map  { |body| body.get_text }
          .then { |data| render(data) }
      end

      def render(data)
        resp   = @ctx.get_response
        header = 'application/json;charset=UTF-8'
        resp.send(header, data)
      end
    end
  end
end
