class Trial < ActiveRecord::Base
  has_many :trials_users
  has_many :users, :through => :trials_users
  belongs_to :organization
end
