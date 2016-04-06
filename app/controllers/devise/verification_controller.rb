module Devise
  class VerificationController < DeviseController
    prepend_before_action :authenticate_scope!

    def new
    end

    def create
      resource.assign_attributes(account_verification_params)

      if resource.valid_for_verification? && resource.save
        set_flash_message :notice, :verified
        redirect_to after_verification_path(resource)
      else
        render 'new'
      end
    end

    protected

    def after_verification_path(resource)
      '/'
    end

    # Authenticates the current scope and gets the current resource from the
    # session
    def authenticate_scope!
      send(:"authenticate_#{resource_name}!", force: true)
      self.resource = send(:"current_#{resource_name}")
    end

    def account_verification_params
      params.require(resource_name)
            .permit(resource_class.fields_for_verification)
    end
  end
end
