class UserMailer < ApplicationMailer
  def notify_admin(user, message)
    @message = message
    mail(to: user.email, subject: 'Message from new user')
  end
end
