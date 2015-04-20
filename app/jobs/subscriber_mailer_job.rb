class SubscriberMailerJob
	include SuckerPunch::Job

  def perform(subscriber_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    SubscriberMailer.response(subscriber_id).deliver
	    SubscriberMailer.received(subscriber_id).deliver
    end
  end
end