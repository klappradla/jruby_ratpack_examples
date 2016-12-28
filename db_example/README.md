# DB Example

Example implementation for non-blocking database access with jRuby and Ratpack.

## Setup

1. Install dependencies

  ```sh
  # ruby dependencies
  $ bundle install

  # java dependencies
  $ jbundle install
  ```

1. Install PostgreSQL and start server locally

1. Set up database

  ```sh
  $ createdb jruby_ratpack_example
  ```

1. Initialize database schema

  ```sh
  $ rake db:init
  ```

1. Populate database with seed data

  ```sh
  $ rake db:seed
  ```

## Getting Started

* Start the server

  ```sh
  $ bin/server

  # curl or visit in browser:
  http://localhost:5050/music
  ```

* Run an interactive console

  ```sh
  $ bin/console
  ```


## Notes

Call endpoint:

    $ curl -v http://localhost:5050/music

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

#### To render proper JSON (content-type: json)

```ruby
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
