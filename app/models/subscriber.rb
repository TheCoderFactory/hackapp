class Subscriber < ActiveRecord::Base
	validates :first_name, :email, :city, :country, presence: true
	# validates :accept_terms, acceptance: true
end
