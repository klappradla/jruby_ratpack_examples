require 'sequel'
DB ||= Sequel.connect('jdbc:postgresql://localhost/jruby_ratpack_example')
