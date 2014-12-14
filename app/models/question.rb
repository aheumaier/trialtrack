class Question < ActiveRecord::Base
  has_and_belongs_to_many :trials
  belongs_to :question_type
  belongs_to :scale

end
