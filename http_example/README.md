# HTTP Example

Example implementation for non-blocking http requests with jRuby and Ratpack.

## Setup

1. Install dependencies

  ```sh
  # ruby dependencies
  $ bundle install

  # java dependencies
  $ bundle exec jbundle install
  ```

1. Install PostgreSQL and start server locally

1. Set up database:

  ```sh
  $ createdb jruby_ratpack_example
  ```

1. Initialize database schema

  ```sh
  $ bundle exec rake db:init
  ```

1. Populate database with seed data

  ```sh
  $ bundle exec rake db:seed
  ```

## Getting Started

* Start the server

  ```sh
  $ bin/server

  # curl or visit in browser:
  http://localhost:5050

  # endpoints:
  http://localhost:5050/music   # db call
  http://localhost:5050/planets # http request to external api
  http://localhost:5050/*       # 404
  ```

* Start the server using a [local planets API](github.com:klappradla/planet_service)

  ```sh
  $ PLANETS_URL="http://localhost:3000/planets" bin/server
  ```

* Run an interactive console

  ```sh
  $ bin/console
  ```
