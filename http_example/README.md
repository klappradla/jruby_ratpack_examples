# HTTP Example

Example implementation for non-blocking http requests with jRuby and Ratpack.

## Setup

1. Install PostgreSQL and start server locally
2. Set up database:
  ```sh
  $ createdb jruby_ratpack_example
  ```

3. Initialize database schema:
  ```sh
  $ rake db:init
  ```

4. Populate database with seed data:
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
* Run an interative console
  ```sh
  $ bin/console
  ```
