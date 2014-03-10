require 'dotenv/tasks'
require Rails.root + 'lib/cj'

task :parse => :environment do
  url = "https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20"
  cj = CJ::Crawler.new(ENV["CJ_KEY"])

   CJ::XmlParser.new(cj.get(url)) do |node|
    merchant = Merchant.new
    merchant.id = CJ::XmlParser.get_value(node, 'advertiser-id')
    merchant.name = CJ::XmlParser.get_value(node, 'advertiser-name')

    offer = Offer.new
    offer.merchant_id = merchant.id
    offer.id = CJ::XmlParser.get_value(node, 'link-id')
    offer.title = CJ::XmlParser.get_value(node, 'link-name')
    offer.url = CJ::XmlParser.get_value(node, 'destination')
    offer.description = CJ::XmlParser.get_value(node, 'description')
    offer.expires_at = CJ::XmlParser.get_value(node, 'promotion-end-date')

    puts offer.inspect
  end
end