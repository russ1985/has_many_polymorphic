$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'bundler/setup'
require 'rails'
require 'active_support'
require 'active_model'
require 'active_record'
require 'action_controller'
require 'simplecov'

DUMMY_APP_ROOT=File.join(File.dirname(__FILE__), '/dummy')

SimpleCov.start

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "spec"
require File.expand_path(DUMMY_APP_ROOT + "/config/environment.rb",  __FILE__)

ActiveRecord::Base.configurations = YAML::load(IO.read(DUMMY_APP_ROOT + "/config/database.yml"))
#ActiveRecord::Base.establish_connection(ENV["RAILS_ENV"])
ActiveRecord::Migration.verbose = false

load(File.join(DUMMY_APP_ROOT, "db", "schema.rb"))

Rails.backtrace_cleaner.remove_silencers!

require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end

require 'support/models'

RussellEdge::HasManyPolymorphic::Engine.add_models("Zoo")
