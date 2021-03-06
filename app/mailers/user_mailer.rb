class UserMailer < ActionMailer::Base
  default from: "michael.goodwin@anz.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to:      user.email,
         cc:      "goodo73@gmail.com", 
         subject: "[AFL Finals Sharemarket] Welcome to the AFL Finals Sharemarket website")
  end
end
