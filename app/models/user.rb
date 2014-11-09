class User < ActiveRecord::Base
  belongs_to :role
  has_one :address, as: :addressable
  belongs_to :organization
  has_one :trials_user
  accepts_nested_attributes_for :address, :trials_user
end
