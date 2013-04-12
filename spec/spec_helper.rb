$:.unshift(File.dirname(__FILE__) + '/../lib')
plugin_test_dir = File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'rails'
require 'active_support'
require 'active_model'
require 'active_record'
require 'action_controller'
require 'simplecov'
require 'rspec/rails'

SimpleCov.start

require 'has_many_polymorphic'
require 'support/models'

ActiveRecord::Base.configurations = YAML::load(ERB.new(IO.read(plugin_test_dir + "/db/database.yml")).result)
ActiveRecord::Base.establish_connection(ENV["DB"] || "spec")
ActiveRecord::Migration.verbose = false
load(File.join(plugin_test_dir, "db", "schema.rb"))

RussellEdge::HasManyPolymorphic::Engine.add_models("Zoo")
