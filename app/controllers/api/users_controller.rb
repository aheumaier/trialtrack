module Api
  class UsersController < Api::BaseController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    def question
      @answer = current_user.answers.joins(:user, :question).where(["answered_at IS NULL AND due_date >= NOW()"]).order(:due_date => :asc).first
      @values = {}
      (@answer.question.scale.scale_start..@answer.question.scale.scale_end).to_a.each do |i|
        @values[i] = {:value => i, :description => ""}
      end
      @answer.question.scale.scalevalues.load.each do |sv|
        @values[sv.value][:description] = sv.description
      end

      @values = @values.flatten.select{|v| v.class != Fixnum}
    end

  end
end