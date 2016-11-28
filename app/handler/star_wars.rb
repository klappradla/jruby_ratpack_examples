java_import 'ratpack.http.client.HttpClient'
java_import 'ratpack.exec.Promise'

module Handler
  class StarWars
    def self.handle(ctx)
      resp = self.call_api(ctx)
      ctx.render resp
    end

    private

    def self.call_api(ctx)
      url = 'http://swapi.co/api/people/?search=bb8'
      uri = java.net.URI.new(url)
      ctx.get(HttpClient.java_class).get(uri).map do |response|
        response.get_body.get_text
      end
    end
  end
end
