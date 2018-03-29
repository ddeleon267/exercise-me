class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy

  validates_presence_of :name, :password
  validates :name, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

  validates :email, uniqueness: true, allow_blank: true

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(uid: auth_hash.uid).first_or_create

    user.name = auth_hash[:info][:nickname]
    user.password = SecureRandom.hex
    user.save
    user
  end

end
