class OffersController < ApplicationController
  def index
    @offers = Offer.where('title is not null')
  end

  def fetch
    offers = OffersCreator.proceed!("https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20", ENV["CJ_KEY"])
    flash[:notice] = "#{offers.size} new offers created!"

    redirect_to offers_path
  end
end