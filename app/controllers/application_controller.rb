class ApplicationController < ActionController::API
    before_action :configure_devise_parameters, if: :devise_controller?

    def render_jsonapi_response(resource)
      if resource.errors.empty?
        render jsonapi: resource
      else
        render jsonapi_errors: resource.errors, status: 400
      end
    end

    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :current_password)}
    end
end
