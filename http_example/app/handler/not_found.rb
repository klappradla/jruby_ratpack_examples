require_relative 'base'

module Handler
  class NotFound < Base
    def handle
      ctx.not_found
    end
  end
end
