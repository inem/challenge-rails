require 'dotenv/tasks'
require Rails.root + 'lib/cj'

task :parse => :environment do
  url = "https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20"
  offers = OffersCreator.proceed!(url, ENV["CJ_KEY"])

  offers.each do |offer|
    puts offer.inspect
  end

end