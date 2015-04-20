module ApplicationHelper
	def hackathon_details(hackathon)
		('<a href=\'/hackathons/' + hackathon.id.to_s + '\'>' + '<strong>' + hackathon.name + '</strong></a>' + '<br>' + hackathon.location_name + '<br>' + hackathon.start_date.strftime('%d %B %Y')).html_safe
	end
	def website_link_text(uri)
	  URI.parse(uri).host + URI.parse(uri).path
	end
end
