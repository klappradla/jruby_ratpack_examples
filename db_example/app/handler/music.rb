java_import 'ratpack.exec.Blocking'
java_import 'ratpack.jackson.Jackson'

module Handler
  class Music
    class << self
      def handle(ctx)
        get_data.then do |data|
          render(ctx, data)
        end
      end

      private

      def get_data
        Blocking.get { DB[:albums].all }
      end

      def render(ctx, data)
        ctx.render(Jackson.json(data))
      end
    end
  end
end
