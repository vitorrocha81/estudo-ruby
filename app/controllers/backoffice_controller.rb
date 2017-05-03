class BackofficeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_admin!
  # layout "backoffice"
  layout "backoffice"
  # layout :layout_backoffice_admin


 def pundit_user
  current_admin # change user to admin, for pundit
 end
  protected

  # def layout_backoffice_admin
  # 	if devise_controller? && resource_name == :admin
  # 		"backoffice_devise"
  # 	else
  # 		"application"
  # 	end
  # end
end
