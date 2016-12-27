java_import 'ratpack.exec.Blocking'
java_import 'ratpack.jackson.Jackson'

module Handler
  class Music < Base
    def handle
      get_data.then do |data|
        render(data)
      end
    end

    private

    def get_data
      Blocking.get { DB[:albums].all }
    end

    def render(data)
      ctx.render(Jackson.json(data))
    end
  end
end
