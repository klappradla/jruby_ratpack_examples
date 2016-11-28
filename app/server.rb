require 'java'
require 'jruby/core_ext'
require 'bundler/setup'
Bundler.require

require_relative './handler/default'
require_relative './handler/star_wars'

java_import 'ratpack.server.RatpackServer'

RatpackServer.start do |server|
  server.handlers do |chain|
    chain.get('pack', Handler::StarWars)
    chain.get do |ctx|
      ctx.render 'Hello World from Ratpack / jRuby'
    end
    chain.all(Handler::Default)
  end
end
