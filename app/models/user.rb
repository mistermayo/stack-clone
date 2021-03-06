class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :questions
  has_many :votes


  validates :name, :email, :presence => true
  validates_uniqueness_of :name

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(self.password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(:email => email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end
end
