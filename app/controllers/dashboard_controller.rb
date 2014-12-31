class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout "application"

  def index

    if current_user.role.name.downcase != params[:user]
      redirect_to "/dashboard/#{current_user.role.name.downcase}" and return
    end

    case params[:user]
      when "superuser", "admin"

      when "teilnehmer"
        @trial, @answers = Answer.answers_for_user(current_user)

    end

    render params[:user]
  end

  def admin
  end

  def teilnehmer


   end
end
