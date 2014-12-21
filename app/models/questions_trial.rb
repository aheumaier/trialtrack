class QuestionsTrial < ActiveRecord::Base
  belongs_to :question
  belongs_to :trial
end
