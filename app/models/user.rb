class User < ApplicationRecord
  # Isso criptografa a senha (precisa da gem 'bcrypt' no Gemfile)
  has_secure_password 

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end