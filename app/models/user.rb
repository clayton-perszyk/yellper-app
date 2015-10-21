class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :comments
  has_many :searches

  def generate_password_reset_token!
    update(password_token: SecureRandom.urlsafe_base64(48))
  end
end
