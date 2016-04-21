class User < ActiveRecord::Base

  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true 
   
end