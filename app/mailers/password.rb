class Password < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password.reset.subject
  #
  def reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
