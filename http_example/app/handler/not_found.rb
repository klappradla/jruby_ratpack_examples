module Handler
  class NotFound < Base
    def handle
      response.status(404).send
    end
  end
end
