module Handler
  class Base
    def self.handle(args)
      new(*args).handle
    end

    def initialize(ctx)
      @ctx = ctx
    end

    def handle
      raise NotImplementedError, "handle not implemented for #{self.class}"
    end

    private

    attr_reader :ctx

    def response
      @response ||= ctx.get_response
    end
  end
end
