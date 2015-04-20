class SubscriberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.response.subject
  #
  def response
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.received.subject
  #
  def received
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
