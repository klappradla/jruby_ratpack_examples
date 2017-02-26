java_import 'ratpack.http.client.HttpClient'

require_relative 'base'

module Handler
  class Planets < Base
    URL = java.net.URI.new(ENV['PLANETS_URL'] || 'http://swapi.co/api/planets')

    def handle
      ctx
        .get(HttpClient.java_class)
        .get(URL)
        .map  { |resp| resp.get_body }
        .map  { |body| body.get_text }
        .then { |data| render(data) }
    end

    private

    def render(data)
      resp   = ctx.get_response
      header = 'application/json;charset=UTF-8'
      resp.send(header, data)
    end
  end
end
