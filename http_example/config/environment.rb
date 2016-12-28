require 'java'
require 'jruby/core_ext'
require 'bundler/setup'
Bundler.require

require_relative '../app/handler/base'
require_relative '../app/handler/music'
require_relative '../app/handler/planets'
require_relative '../app/handler/not_found'

DB = Sequel.connect('jdbc:postgresql://localhost/jruby_ratpack_example')
