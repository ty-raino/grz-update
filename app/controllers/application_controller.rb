class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found
      flash[:error] = "Page not found"
      redirect_to root_path
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
