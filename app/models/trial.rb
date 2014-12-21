class Trial < ActiveRecord::Base
  has_many :trials_users
  has_many :users, :through => :trials_users

  has_many :questions_trials
  has_many :questions, :through => :questions_trials

  belongs_to :organization
end
