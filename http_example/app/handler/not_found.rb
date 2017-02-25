module Handler
  class NotFound < Base
    def call
      ctx.not_found
    end
  end
end
