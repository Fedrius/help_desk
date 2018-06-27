class User < ActiveRecord::Base
  # one user has many articles
  has_many :articles
  
  #before user hits db, email will be downcased
  before_save {self.email = email.downcase }
  
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password 
  
  # validates :password_digest, presence: true, on: :create
  validates :password_digest, allow_blank: true, presence: false, on: :update
end