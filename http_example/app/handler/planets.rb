java_import 'ratpack.http.client.HttpClient'

module Handler
  class Planets < Base
    URL = java.net.URI.new(ENV['PLANETS_URL'] || 'http://swapi.co/api/planets')

    def call
      ctx
        .get(HttpClient.java_class)
        .get(URL)
        .map { |resp| resp.get_body }
        .map { |body| body.get_text }
        .then(&render)
    end

    private

    def render
      ->(data) { resp.send('application/json;charset=UTF-8', data) }
    end
  end
end
