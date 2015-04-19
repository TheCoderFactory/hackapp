class PagesController < ApplicationController
	skip_before_action :authenticate_user!, except: :admin

  def home
  	@hackathon_countries = Hackathon.order(country: :asc).pluck("DISTINCT country")
  	if params[:country]
  		@hackathons = Hackathon.where(country: params[:country])
  	elsif params[:country_name]
      @country_code = IsoCountryCodes.search_by_name(params[:country_name]).first.alpha2
      @hackathons = Hackathon.where(country: @country_code)
    elsif params[:tag]
      @hackathons = Hackathon.tagged_with(params[:tag])
    else
  		@hackathons = Hackathon.future_hackathons
  	end
    @tags = Hackathon.tag_counts_on(:tags)
  end



  def contact
    @enquiry = Enquiry.new
  end
end
