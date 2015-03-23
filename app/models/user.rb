class User < ActiveRecord::Base
  has_many :questions


  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :password, minimum: 8

  has_secure_password

end
