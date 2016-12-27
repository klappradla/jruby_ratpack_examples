## Setup
* install postgresql
* set up database
      $ createdb jruby_ratpack_example
* init database schema
      $ rake db:init
* populate database with seed data
      $ rake db:seed


## Notes

Blocking DB call simple:
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

From the docs:
> Performs a blocking operation on a separate thread, returning a promise for its value.


### Alternative

Implement [Handler Interface](https://ratpack.io/manual/current/api/ratpack/handling/Handler.html) (single method: `handle(ctx)`). Multiple ways to do this, e.g. class methods:

```ruby
# server
RatpackServer.start do |server|
  server.handlers do |chain|
    chain.all(RequestLogger.ncsa)
    chain.get('music', Handler::Music)
  end
end

# handler
java_import 'ratpack.exec.Blocking'

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
        ctx.render(JSON.dump(data))
      end
    end
  end
end
```
