class Trial < ActiveRecord::Base
  has_many :trials_users
  has_many :users, :through => :trials_users
  has_and_belongs_to_many :questions
  belongs_to :organization
end
