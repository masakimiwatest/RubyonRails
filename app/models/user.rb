class User < ApplicationRecord
    validates :name, presence: true , length: { maximum: 100 },uniqueness: true
    validates :email, presence: true, length: { maximum: 100 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
