class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # allow strong params  for custom devise forms
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name, :email, :password,:password_confirmation,:current_password,:role_id,
                                                                   {address_attributes: [ :id, :street, :city, :city_code, :country ]}, :organization_id )
    }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name, :email, :password,:password_confirmation,:current_password,:role_id,
                                                                   {address_attributes: [ :id, :street, :city, :city_code, :country ]}, :organization_id )
    }
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    welcome_index_path
  end

  def after_sign_in_path_for(resource_or_scope)
    #DashboardController.send("dashboard_#{current_user.role.name.downcase}_path") doesnt work properly so we do
    case current_user.role.name.downcase
      when "superuser"
        dashboard_superuser_path
      when "admin"
        dashboard_admin_path
      else
        dashboard_teilnehmer_path
    end
  end



end
