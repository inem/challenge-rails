$LOAD_PATH.unshift File.dirname(__FILE__)
require 'open-uri'
require 'cj'

# ↓ Secret keys shouldn't be stored in repository, so let's store it as separate file .env
require 'dotenv'
Dotenv.load

url = "https://linksearch.api.cj.com/v2/link-search?website-id=5742006&records-per-page=20"
cj = CJ::Crawler.new(ENV["CJ_KEY"])

CJ::XmlParser.new(cj.get(url)) do |node|
  puts CJ::XmlParser.get_value(node, 'advertiser-id')
  puts CJ::XmlParser.get_value(node, 'advertiser-name')

  puts CJ::XmlParser.get_value(node, 'link-id')
  puts CJ::XmlParser.get_value(node, 'link-name')
  puts CJ::XmlParser.get_value(node, 'destination')
  puts CJ::XmlParser.get_value(node, 'description')
  puts CJ::XmlParser.get_value(node, 'promotion-end-date')

  puts
end