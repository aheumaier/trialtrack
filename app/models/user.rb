class User < ActiveRecord::Base
  belongs_to :role
  has_one :address, as: :addressable
  belongs_to :organization 
  has_many :trials_users
  has_many :trials, :through => :trials_users
  accepts_nested_attributes_for :address, :trials


  def full_name
    self.first_name+' '+self.last_name
  end
end
