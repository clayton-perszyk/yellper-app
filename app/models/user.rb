class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :comments
  has_many :searches

  def self.verifier
    Rails.application.message_verifier('reset-password')
  end

  def reset_password_token
    User.verifier.generate([id, Time.now])
  end

  def reset_password!(new_password)
    self.password = new_password
    save!
  end

  def self.find_by_token (token)
    begin
      user_id, timestamp = verifier.verify(token)
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      false
    end
    @user = find_by_id(user_id)
    if timestamp > 4.hours.ago $$ @user
      @user
    else
      false
    end
  end
end
