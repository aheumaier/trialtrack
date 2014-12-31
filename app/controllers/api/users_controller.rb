module Api
  class UsersController < Api::BaseController
    #skip_before_action :verify_authenticity_token
    #before_action :authenticate_user!

    def questions
      @trial, @answers = Answer.answers_for_user(current_user)
    end

  end
end