# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://welovehackathons.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
    @hackathon_countries = Hackathon.order(country: :asc).pluck("DISTINCT country")
    @hackathon_countries.each do |hackathon_country|
      add ISO3166::Country[hackathon_country].to_s
    end
    Hackathon.approved.find_each do |hackathon|
      add hackathon_path(hackathon), :lastmod => hackathon.updated_at
    end
end
