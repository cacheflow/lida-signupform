class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :add_whitelisted_params_to_sign_in, if: :devise_controller?
  before_action :add_whitelisted_params_to_account_update, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:avatar, :name, :role, :offer, :current_password)}
  end

  def add_whitelisted_params_to_sign_in
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:avatar, :name, :role, :offer, :current_password)}
  end

  def add_whitelisted_params_to_account_update
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:avatar, :name, :role, :offer, :current_password)}
  end
end
