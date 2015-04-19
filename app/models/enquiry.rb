class Enquiry < ActiveRecord::Base

	validates :first_name, :email, :message, presence: true
end
