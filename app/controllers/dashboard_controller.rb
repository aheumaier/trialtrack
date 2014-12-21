class DashboardController < ApplicationController

  before_action :authenticate_user!

  def superuser
    @users = User.all.load
    @trials = Trial.all.load
    @roles = Role.all.load
    @organizations = Organization.all.load
  end

  def admin
  end

  def teilnehmer
    @trials = current_user.trials_users.where(["start_date <= NOW() AND end_date >= NOW()"]).load.select {|tu| tu.trial}
  end
end
