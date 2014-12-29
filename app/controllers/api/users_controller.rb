module Api
  class UsersController < Api::BaseController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    def question
      @answer = current_user.answers.joins(:user, :question).where(["answered_at IS NULL AND due_date >= NOW()"]).order(:due_date => :asc).first
    end

  end
end