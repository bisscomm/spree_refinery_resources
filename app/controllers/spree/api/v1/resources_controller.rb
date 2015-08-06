module Spree
  module Api
    module V1
      class ResourcesController < Spree::Api::BaseController
        def index
          if params[:ids]
            @resources = Refinery::Resource.includes(:translations).accessible_by(current_ability, :read).where(id: params[:ids].split(','))
          else
            @resources = Refinery::Resource.includes(:translations).accessible_by(current_ability, :read).load.ransack(params[:q]).result
          end
          respond_with(@resources)
        end

        def show
          @resource = Refinery::Resource.accessible_by(current_ability, :read).find(params[:id])
          respond_with(@resource)
        end

        # def create
        #   authorize! :create, Spree::OptionType
        #   @option_type = Spree::OptionType.new(option_type_params)
        #   if @option_type.save
        #     render :show, :status => 201
        #   else
        #     invalid_resource!(@option_type)
        #   end
        # end

        # def update
        #   @option_type = Spree::OptionType.accessible_by(current_ability, :update).find(params[:id])
        #   if @option_type.update_attributes(option_type_params)
        #     render :show
        #   else
        #     invalid_resource!(@option_type)
        #   end
        # end

        # def destroy
        #   @option_type = Spree::OptionType.accessible_by(current_ability, :destroy).find(params[:id])
        #   @option_type.destroy
        #   render :text => nil, :status => 204
        # end

        private
          def resource_params
            params.require(:resource).permit(permitted_resource_attributes)
          end
      end
    end
  end
end