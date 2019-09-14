class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  # The user argument here takes the self argument from the user model that is passed in UserMailer.password_reset(self).deliver
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
