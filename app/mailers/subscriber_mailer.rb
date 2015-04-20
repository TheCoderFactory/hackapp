class SubscriberMailer < ApplicationMailer
  default from: "We Love Hackathons <info@welovehackathons.com>"
  def response(subscriber_id)
    @subscriber = Subscriber.find(subscriber_id)
    mail(to: 'pete@thecoderfactory.com', subject: 'New hackathon subscriber')
  end
  def received(subscriber_id)
    @subscriber = Subscriber.find(subscriber_id)
    mail(to: @subscriber.email, subject: 'Thanks ' + @subscriber.first_name + ', we love you too!')
  end
end
