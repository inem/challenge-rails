class OffersController < ApplicationController
  def index
    @offers = Offer.where('title is not null')
  end

  def fetch
    cj = CJ::Crawler.new(ENV["CJ_KEY"])
    xml = cj.get("https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20")
    offers = OffersCreator.proceed!(xml)
    flash[:notice] = "#{offers.size} new offers created!"

    redirect_to offers_path
  end
end