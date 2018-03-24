class User < ApplicationRecord
  has_secure_password #may decide to ultimately go with devise
  has_many :workouts

  validates_presence_of :name, :password, :email
  validates :name, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  #validates :password, confirmation: true

  #maybe don't use this???
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  #probably will need method to handle omniauth here


end
