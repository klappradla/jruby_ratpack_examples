require 'json'
require_relative 'handler/music'

class Server < Sinatra::Base
  configure do
    set :server, :trinidad
    set :port, '5050'
    enable :logging
  end

  before { content_type :json }

  get('/music') { Handler::Music.handle }
end
