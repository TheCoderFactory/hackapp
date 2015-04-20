class HackathonMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hackathon_mailer.weekly_update.subject
  #
  def weekly_update
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
