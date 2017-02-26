module Handler
  class NotFound
    class << self
      def handle(ctx)
        ctx.not_found
      end
    end
  end
end
