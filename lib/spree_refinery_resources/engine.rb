module SpreeRefineryResources
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_refinery_resources'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree_refinery_resources.permitted_attributes", before: :load_config_initializers do |app|
      # product_attributes = resource_ids: []
      # Spree::PermittedAttributes.product_attributes << product_attributes
      Spree::PermittedAttributes.product_attributes.concat([{resource_ids: []}])
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
