class Organization < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :users
end
