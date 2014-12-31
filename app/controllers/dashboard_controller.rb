class DashboardController < ApplicationController

  before_action :authenticate_user!
  layout "application"

  def index

    @user = @user || current_user
    @role = @role || @user.role.load
    @organization = @user.organization

    if @role.name.downcase != params[:user]
      redirect_to "/dashboard/#{@role.name.downcase}" and return
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
