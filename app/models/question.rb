class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :scale
end
