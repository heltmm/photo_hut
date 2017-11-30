class UserMailer < ApplicationMailer
  def send_new_user_message(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end
end
