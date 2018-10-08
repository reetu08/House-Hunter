class ReplyMailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers

  def reply_email
    @inquiry_reply = params[:inquiry_reply]
    mail(to: @inquiry_reply.inquiry.user.email, subject: 'You Received a Reply!')
  end

end