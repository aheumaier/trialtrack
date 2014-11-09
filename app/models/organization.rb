class Organization < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :users
  accepts_nested_attributes_for :address, :users
end
