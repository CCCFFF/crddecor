class User < ActiveRecord::Base

  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :homes
  has_many :rooms, :through => :homes
  has_many :pictures, :through => :rooms

end
