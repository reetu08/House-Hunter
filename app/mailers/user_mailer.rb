class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    @token = params[:token]
    mail(to: @user.email, subject: 'Welcome to House Hunters')
  end

end
