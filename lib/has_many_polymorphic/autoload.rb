require 'initializer' unless defined? ::Rails::Initializer
require 'action_controller/dispatcher' unless defined? ::ActionController::Dispatcher

module RussellEdge
  module HasManyPolymorphic

=begin rdoc
Searches for models that use <tt>has_many_polymorphic</tt> and makes sure that they get loaded during app initialization.
This ensures that helper methods are injected into the target classes.
=end
    
	#define the models that use has_many_polymorphic. has_many_polymorphs combed the file system for models
	#that had the has_many_polymorphs method.  This is not as robust but more efficent.  It can be set via
	#
	#RussellEdge::HasManyPolymorphic::DEFAULT_OPTIONS = { :models => %w(PreferenceType AnotherModel) }
	# 
    DEFAULT_OPTIONS = {
      :models => %w()
    }

    mattr_accessor :options
    @@options = HashWithIndifferentAccess.new(DEFAULT_OPTIONS)

    # Dispatcher callback to load polymorphic relationships
    def self.autoload
      options[:models].each do |model|
        #try to load model if it exists.
        begin
          model.constantize
        rescue=>e
        end
      end
      
    end
  end
end

class Rails::Initializer #:nodoc:
  # Make sure it gets loaded in the console, tests, and migrations
  def after_initialize_with_autoload
    after_initialize_without_autoload
    RussellEdge::HasManyPolymorphic.autoload
  end
  alias_method_chain :after_initialize, :autoload
end

ActionController::Dispatcher.to_prepare(:morpheus_autoload) do
  # Make sure it gets loaded in the app
  RussellEdge::HasManyPolymorphic.autoload
end