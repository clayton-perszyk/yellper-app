class Reset < ApplicationMailer
  def password_reset(user)
    @user = user
    @reset_password_url = reset_url(@user.reset_password_token)
    mail(to: user.email, subject: "Your request to reset your password")
  end
end
