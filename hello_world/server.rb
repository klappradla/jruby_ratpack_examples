require 'java'
require 'jruby/core_ext'
require 'bundler/setup'
Bundler.require

java_import 'ratpack.server.RatpackServer'
java_import 'ratpack.handling.RequestLogger'

RatpackServer.start do |server|
  server.handlers do |chain|
    chain.all(RequestLogger.ncsa)
    chain.get do |ctx|
      ctx.render 'Hello World from Ratpack / jRuby'
    end
  end
end
