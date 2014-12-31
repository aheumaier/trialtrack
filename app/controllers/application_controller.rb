class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' && c.request.fullpath.match(/^api/)}

  acts_as_token_authentication_handler_for User

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    logger.debug "CanCan exeption is called"
    #respond_to do |format|

      #format.json { render :json=> exception.to_json, :status => :forbidden }
      #format.html { render :html=> exception.to_s, :status => :forbidden }

    #end
    redirect_to "/dashboard/#{current_user.role.name.downcase}", :alert => exception.message
  end

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
    return nil if request.format == 'application/json'
    "/dashboard/#{current_user.role.name.downcase}"
  end

  def authenticate_user_from_token!
    user_token = params[:user_token].presence
    user = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      if user.timedout?(user.current_sign_in_at)
        return
      end

      sign_in user, store: false
    end
  end


end
