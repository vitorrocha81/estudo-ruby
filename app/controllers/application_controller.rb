class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_backoffice_admin

  protected

  def layout_backoffice_admin
  	if devise_controller? && resource_name == :admin
  		"backoffice_devise"
  	else
  		"application"
  	end
  end
end