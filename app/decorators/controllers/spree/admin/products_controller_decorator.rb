Spree::Admin::ProductsController.class_eval do
  before_action :split_resource_ids, only: :update

  private

  def split_resource_ids
    if params[:product][:resource_ids].present?
      params[:product][:resource_ids] = params[:product][:resource_ids].split(',')
    end
  end
end