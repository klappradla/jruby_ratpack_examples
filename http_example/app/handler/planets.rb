java_import 'ratpack.http.client.HttpClient'

module Handler
  class Planets < Base
    URL = java.net.URI.new(ENV['PLANETS_URL'] || 'http://swapi.co/api/planets')

    def handle
      ctx
        .get(HttpClient.java_class)
        .get(URL)
        .then(&render)
    end

    private

    def render
      ->(data) { build_response(data) }
    end

    def build_response(resp)
      response.send('application/json;charset=UTF-8', resp.get_body.get_text)
    end
  end
end
