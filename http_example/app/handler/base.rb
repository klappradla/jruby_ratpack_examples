module Handler
  class Base
    def self.handle(ctx)
      new(ctx).call
    end

    def initialize(ctx)
      @ctx  = ctx
      @resp = ctx.get_response
    end

    def call
      raise NotImplementedError
    end

    private

    attr_reader :ctx, :resp
  end
end
