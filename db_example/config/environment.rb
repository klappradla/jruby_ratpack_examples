require 'java'
require 'jruby/core_ext'
require 'bundler/setup'
Bundler.require

DB = Sequel.connect('jdbc:postgresql://localhost/jruby_ratpack_example')
