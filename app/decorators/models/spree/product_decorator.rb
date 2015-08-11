Spree::Product.class_eval do
  has_many :product_resources, class_name: 'Spree::ProductResource', dependent: :destroy, foreign_key: :product_id
  has_many :resources, through: :product_resources, class_name: 'Refinery::Resource'
end