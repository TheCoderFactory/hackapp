class AdminController < ApplicationController
  def index
  	@upcoming_hackathons = Hackathon.all
    @archived_hackathons = Hackathon.past_hackathons
    @subscribers = Subscriber.all
    @enquiries = Enquiry.all
  end
end
