class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :contact, :email, :password, :gender) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :contact, :email, :password, :current_password, :gender, :avatar) }
    end

    def after_sign_in_path_for(resource)
      if resource.admin?
        admin_root_path
      else
        root_path
      end
    end

    def record_not_found
      redirect_to root_path, alert: "Record Not Found"
    end

end
