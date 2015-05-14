class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  layout "welcome"

  def index
  end
end
