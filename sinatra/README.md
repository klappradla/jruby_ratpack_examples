# Sinatra implementation

Pure jRuby implementation of the [HTTP Requests Example](../http_example) using [Sinatra](http://www.sinatrarb.com/).

## Setup

1. Install dependencies

  ```sh
  $ bundle install
  ```

1. Install PostgreSQL and start server locally

1. Set up database:

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
