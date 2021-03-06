class SessionsController < Devise::SessionsController

  respond_to :json

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    current_user.update authentication_token: nil
    respond_to do |format|
      format.json {

        apikey = params["user"]["apikey"]
        if apikey.blank? || apikey != Medicore::API_KEY
          render json:{message: "client not authorized"}, status: 403 and return
        end

        render :json => {
            :user => current_user,
            :status => :ok,
            :authentication_token => current_user.authentication_token
        }
      }
      format.html {
        super
      }
    end
  end

  def destroy
    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end
      }
      format.html {
        super
      }
    end
  end


end
