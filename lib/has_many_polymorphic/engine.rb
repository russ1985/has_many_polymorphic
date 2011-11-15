module RussellEdge
  module HasManyPolymorphic
    class Engine < Rails::Engine
      isolate_namespace HasManyPolymorphic
      DEFAULT_OPTIONS = {:models => %w()}
      @@options = HashWithIndifferentAccess.new(DEFAULT_OPTIONS)

      initializer "has_many_polymorphic.autoload_models", :after => :load_config_initializers do |app|
        RussellEdge::HasManyPolymorphic::Engine.autoload_models
      end

      ActiveSupport.on_load(:active_record) do
        include RussellEdge::HasManyPolymorphic
      end
      
      #set engine to scope
      engine = self
      config.to_prepare do
        engine.autoload_models
      end

      class << self
        def add_models(models)
          if models.is_a? Array
            @@options[:models] = @@options[:models] | models
          else
            @@options[:models] << models
          end
        end

        # Dispatcher callback to load polymorphic relationships
        def autoload_models
          @@options[:models].each do |model|
            #try to load model if it exists.
            begin
              model.constantize
            rescue=>e
            end
          end
        end
      end
    end
  end
end