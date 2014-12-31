class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def scale
    values = {}
    (self.question.scale.scale_start..self.question.scale.scale_end).to_a.each do |i|
      values[i] = {:value => i, :description => ""}
    end
    self.question.scale.scalevalues.load.each do |sv|
      values[sv.value][:description] = sv.description
    end

    values.flatten.select{|v| v.class != Fixnum}
  end

  def self.answers_for_user(user)\
    return [] if user.nil?

    if trial_user = user.trials_users.where(["start_date <= NOW() AND end_date >= NOW()"]).limit(1).first
      trial = trial_user.trial
      ids = trial.questions.load.select {|q| q.id}

      #TODO: remove comment for production
      answers = Answer.joins(:question).where(["user_id = ? AND value IS NULL AND questions.id IN (?) /*AND due_date >= NOW()*/", user.id, ids]).group(:question_id).to_a || []
      [trial, answers]
    else
      []
    end
  end


end
