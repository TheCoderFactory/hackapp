class EnquiryMailer < ApplicationMailer
  default from: "We Love Hackathons <info@welovehackathons.com>"
  def response(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail(to: 'pete@thecoderfactory.com', subject: 'Hackathon Enquiry')
  end
  def received(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    mail(to: @enquiry.email, subject: 'Your enquiry has been received.')
  end
end
