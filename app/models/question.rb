class Question < ActiveRecord::Base
  has_many :questions_trials
  has_many :trials, :through => :questions_trials
  belongs_to :question_type
  belongs_to :scale

end
