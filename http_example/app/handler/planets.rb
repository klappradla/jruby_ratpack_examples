java_import 'ratpack.http.client.HttpClient'

module Handler
  class Planets < Base
    URL = java.net.URI.new('http://swapi.co/api/planets')

    def handle
      call_api.then do |resp|
        render(resp)
      end
    end

    private

    def call_api
      client.get(URL)
    end

    def client
      ctx.get(HttpClient.java_class)
    end

    def render(resp)
      response.send('application/json;charset=UTF-8', resp.get_body.get_text)
    end
  end
end
