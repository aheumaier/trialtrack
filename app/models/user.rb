class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_one :address, as: :addressable
  belongs_to :organization 
  has_many :trials_users
  has_many :trials, :through => :trials_users
  accepts_nested_attributes_for :address, :trials
  has_many :answers

  acts_as_token_authenticatable

  def full_name
    self.first_name+' '+self.last_name
  end

  def addresses=(h)
    self.adress = h
  end

end
