class Trial < ActiveRecord::Base
  has_many :trials_users
  belongs_to :organization
end
