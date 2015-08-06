module Spree
  class ProductResource < ActiveRecord::Base
    self.table_name = 'spree_product_resources'

    belongs_to :product, class_name: 'Spree::Product', :foreign_key => :product_id
    belongs_to :resource, class_name: 'Refinery::Resource', :foreign_key => :resource_id
  end
end