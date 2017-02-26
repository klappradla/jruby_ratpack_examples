java_import 'ratpack.exec.Blocking'
java_import 'ratpack.jackson.Jackson'

require_relative 'base'

module Handler
  class Music < Base
    def handle
      Blocking
        .get { DB[:albums].all }
        .map { |data| Jackson.json(data)}
        .then { |data| ctx.render(data) }
    end
  end
end
