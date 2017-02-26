java_import 'ratpack.server.RatpackServer'
java_import 'ratpack.handling.RequestLogger'

require_relative './handler/music'
require_relative './handler/not_found'
require_relative './handler/planets'

class Server
  def self.run
    RatpackServer.start do |server|
      server.handlers do |chain|
        chain.all(RequestLogger.ncsa)
        chain.get('music', Handler::Music)
        chain.get('planets', Handler::Planets)
        chain.all(Handler::NotFound)
      end
    end
  end
end
