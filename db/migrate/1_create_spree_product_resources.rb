class CreateSpreeProductResources < ActiveRecord::Migration
  def change
    create_table :spree_product_resources do |t|
      t.belongs_to :product
      t.belongs_to :resource
    end
    add_index :spree_product_resources, :product_id
    add_index :spree_product_resources, [:product_id, :resource_id], :name => 'spree_product_resource_by_product_and_resource_id'
  end
end