class AdminController < ApplicationController
	# load_and_authorize_resource
  def index
  	if current_user.has_role? :admin
	  	@upcoming_hackathons = Hackathon.all
	    @archived_hackathons = Hackathon.past_hackathons
	    @subscribers = Subscriber.all
	    @enquiries = Enquiry.all
	  else
	  	redirect_to root_path
	  end
  end
end
