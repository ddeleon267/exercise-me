class User < ApplicationRecord
  has_secure_password #may decide to ultimately go with devise
  has_many :workouts

  validates_presence_of :username, :password, :email
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
