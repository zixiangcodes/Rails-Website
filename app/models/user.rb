class User < ApplicationRecord
    has_secure_password

    validates :password, length: { minimum: 6 }, allow_nil: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
end