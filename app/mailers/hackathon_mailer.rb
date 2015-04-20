class HackathonMailer < ApplicationMailer
	default from: "We Love Hackathons <info@welovehackathons.com>"
	def weekly_update(enquiry_id)
	  @enquiry = Enquiry.find(enquiry_id)
	  mail(to: 'pete@thecoderfactory.com', subject: 'Hackathon Enquiry')
	end
end
