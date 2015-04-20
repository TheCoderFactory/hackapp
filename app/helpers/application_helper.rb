module ApplicationHelper
	def hackathon_details(hackathon)
		('<a href=\'/hackathons/' + hackathon.id.to_s + '\'>' + '<strong>' + hackathon.name + '</strong></a>' + '<br>' + hackathon.location_name + '<br>' + hackathon.start_date.strftime('%d %B %Y')).html_safe
	end
	def website_link_text(uri)
	  URI.parse(uri).host + URI.parse(uri).path
	end

	def hackathon_status(hackathon)
		if hackathon.status.nil?
			if current_user.has_role? :admin
				html = '<a href="/approve_hackathon?hackathon='.html_safe + hackathon.id.to_s + '" class="btn btn-xs btn-success">APPROVE</a>'.html_safe
			else
				html = '<small><span class="label label-warning">PENDING APPROVAL</span></small>'.html_safe
			end
		else
			html = '<small><span class="label label-default">APPROVED</span></small>'.html_safe
		end
	end

	def currency_code(hackathon)
		html = IsoCountryCodes.find(hackathon.country).currency
	end
end


