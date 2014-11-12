class Organization < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :users
  has_many :trials
  accepts_nested_attributes_for :address
end
