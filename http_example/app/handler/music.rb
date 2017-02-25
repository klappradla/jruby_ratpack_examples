java_import 'ratpack.exec.Blocking'
java_import 'ratpack.jackson.Jackson'

module Handler
  class Music < Base
    def call
      Blocking
        .get { DB[:albums].all }
        .map { |data| Jackson.json(data)}
        .then { |data| ctx.render(data) }
    end
  end
end
