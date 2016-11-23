* Hello World example
  * https://ratpack.io/manual/current/launching.html

  ```java
  public class Main {
    public static void main(String... args) throws Exception {
      RatpackServer.start(server -> server
        .handlers(chain -> chain
          .get(ctx -> ctx.render("Hello World")
        )
      );
    }
  }
  ```

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
