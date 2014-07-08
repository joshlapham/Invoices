class User < ActiveRecord::Base

  has_many :clients
  accepts_nested_attributes_for :clients

  before_save { self.email = email.downcase }

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_confirmation_of :password

end
