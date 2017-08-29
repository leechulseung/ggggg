class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #protect_from_forgery with: :exception

  # @user.errors.messages.each do |key, value|
  #   @email_error = value[0]
  # end
    
  def authenticate_admin
    redirect_to '/' unless current_user.admin
  end
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:number])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:major])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:job])
  end
end
