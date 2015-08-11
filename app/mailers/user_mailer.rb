class UserMailer < ApplicationMailer

  default :from => "from@viking.com"

  def welcome(user)
    @user=user
    mail(to: @user.email, subject: 'Welcome to Viking!')
  end
end
