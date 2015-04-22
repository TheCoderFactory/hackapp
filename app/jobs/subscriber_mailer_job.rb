class SubscriberMailerJob
	include SuckerPunch::Job

  def perform(subscriber_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    SubscriberMailer.response(subscriber_id).deliver
	    SubscriberMailer.received(subscriber_id).deliver
	    @subscriber = Subscriber.find(subscriber_id)
	    gb = Gibbon::API.new
	    gb.lists.subscribe({:id => 'acc86ca450', :email => {:email => @subscriber.email}, :merge_vars => {:FNAME => @subscriber.first_name, :CITY => @subscriber.city, :COUNTRY => @subscriber.country}, :double_optin => false})
    end
  end
end