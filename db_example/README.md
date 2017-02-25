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
  http://localhost:5050/music
  ```

* Run an interactive console

  ```sh
  $ bin/console
  ```
