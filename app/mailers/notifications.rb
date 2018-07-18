class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.ticket.subject
  #
  def ticket
    @ticket = "tester"
    @comment = "commenting"

    mail to: "paulmlee.dev@gmail.com",
          subject: "New tice"
  end
end
