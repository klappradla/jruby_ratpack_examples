## Hello World

* Java Code (https://ratpack.io/manual/current/launching.html)

  ```java
  public class Main {
    public static void main(String... args) throws Exception {
      RatpackServer.start(server -> server
        .handlers(chain -> chain
          .get(ctx -> ctx.render("Hello World"))
        )
      );
    }
  }
  ```

* "Translated" to Ruby

  ```ruby
  require 'java'
  require 'jruby/core_ext'
  require 'bundler/setup'
  Bundler.require

  java_import 'ratpack.server.RatpackServer'

  RatpackServer.start do |server|
    server.handlers do |chain|
      chain.get do |ctx|
        ctx.render 'Hello World from Ratpack / jRuby'
      end
    end
  end
  ```

* Add logging

  ```ruby
  java_import 'ratpack.server.RatpackServer'
  java_import 'ratpack.handling.RequestLogger'

  RatpackServer.start do |server|
    server.handlers do |chain|
      chain.all(RequestLogger.ncsa)
      chain.get do |ctx|
        ctx.render 'Hello World from Ratpack / jRuby'
      end
    end
  end
  ```

* Implementing an interface: `all(Handler handler)`
  * https://ratpack.io/manual/current/api/ratpack/handling/Chain.html#all-java.lang.Class-
  * https://ratpack.io/manual/current/api/ratpack/handling/Handler.html

  ```ruby
  RatpackServer.start do |server|
    server.handlers do |chain|
      chain.get do |ctx|
        ctx.render 'Hello World from Ratpack / jRuby'
      end
      chain.all(Handler::Default)
    end
  end

  # handler/default.rb
  module Handler
    class Default
      def self.handle(ctx)
        ctx.render 'Nothing here, sorry ¯\_(ツ)_/¯'
      end
    end
  end
  ```

## DB Example

* Blocking DB call simple:
  * From the docs (Blocking.get):
  > Performs a blocking operation on a separate thread, returning a promise for its value.

  ```ruby
  java_import 'ratpack.server.RatpackServer'
  java_import 'ratpack.exec.Blocking'

  require 'json'

  RatpackServer.start do |server|
    server.handlers do |chain|
      chain.get('music') do |ctx|
        Blocking.get do
          DB[:albums].all
        end.then do |albums|
          ctx.render(JSON.dump(albums))
        end
      end
    end
  end
  ```

* Alternative: implement Handler interface

  [Handler Interface](https://ratpack.io/manual/current/api/ratpack/handling/Handler.html) (single method: `handle(ctx)`). Multiple ways to do this, e.g. class methods:

  ```ruby
  # server
  RatpackServer.start do |server|
    server.handlers do |chain|
      chain.get('music', Handler::Music)
    end
  end

  # handler
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
  ```
