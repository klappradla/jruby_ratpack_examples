java_import 'ratpack.server.RatpackServer'
java_import 'ratpack.handling.RequestLogger'

RatpackServer.start do |server|
  server.handlers do |chain|
    chain.all(RequestLogger.ncsa)
    chain.get('music', Handler::Music)
    chain.get('planets', Handler::Planets)
    chain.all(Handler::NotFound)
  end
end
