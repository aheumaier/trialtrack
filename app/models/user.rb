class User < ActiveRecord::Base
  belongs_to :role
  has_one :address, as: :addressable
  belongs_to :organization
end
