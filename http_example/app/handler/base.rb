module Handler
  class Base
    def self.handle(ctx)
      new(ctx).handle
    end

    def initialize(ctx)
      @ctx = ctx
    end

    attr_reader :ctx

    def handle
      raise NotImplementedError
    end
  end
end
