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
    @answers = []

    @trial = current_user.trials_users.where(["start_date <= NOW() AND end_date >= NOW()"]).limit(1).first.trial
    ids = @trial.questions.load.select {|q| q.id}

    #TODO: remove comment for production
    @answers = Answer.joins(:question).where(["user_id = ? AND value IS NULL AND questions.id IN (?) /*AND due_date >= NOW()*/", current_user.id, ids]).group(:question_id).to_a || []
   end
end
