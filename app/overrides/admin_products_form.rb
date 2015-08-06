Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_refinery_resources",
                     :insert_after => "[data-hook='admin_product_form_option_types']",
                     :partial => "spree/admin/products/form_resources")