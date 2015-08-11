Refinery::Resource.class_eval do
  has_many :resource_products, class_name: 'Spree::ProductResource', :foreign_key => :resource_id
  has_many :products, through: :resource_products, class_name: 'Spree::Product'
end