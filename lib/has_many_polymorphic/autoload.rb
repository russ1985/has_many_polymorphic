module RussellEdge
  module HasManyPolymorphic

=begin rdoc
Searches for models that use <tt>has_many_polymorphic</tt> and makes sure that they get loaded during app initialization.
This ensures that helper methods are injected into the target classes.
=end
    
	#define the models that use has_many_polymorphic. has_many_polymorphs combed the file system for models
	#that had the has_many_polymorphs method.  This is not as robust but more efficent.  It can be set via
	#
	#RussellEdge::HasManyPolymorphic::OPTIONS = { :models => %w(PreferenceType AnotherModel) }
	# 
    DEFAULT_OPTIONS = {:models => %w()}
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

#create Railtie to plugin into rails initialization
class RussellEdge::HasManyPolymorphic::RailTie < Rails::Railtie
  initializer "has_many_polymorphic.autoload_models", :after => :initialize do |app|
      RussellEdge::HasManyPolymorphic.autoload
   end
end
