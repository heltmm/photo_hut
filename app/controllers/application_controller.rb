class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  def after_sign_in_path_for(resource)
    images_path
  end

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :is_female, :date_of_birth, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :is_female, :date_of_birth, :avatar])
  end
end
