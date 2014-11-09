class TrialsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :trial
end
