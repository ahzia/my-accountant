class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource)
  #     if resource.is_a?(User)
  #       # catagories_url
  #     else
  #       super
  #     end
  # end
end
