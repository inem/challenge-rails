class OffersCreator
  def self.proceed!(url, key)
    cj = CJ::Crawler.new(key)

    offers = []
    CJ::XmlParser.new(cj.get(url)) do |node|
      merchant_id = CJ::XmlParser.get_value(node, 'advertiser-id')
      merchant = Merchant.new
      merchant.id = merchant_id
      merchant.name = CJ::XmlParser.get_value(node, 'advertiser-name')

      offer_id = CJ::XmlParser.get_value(node, 'link-id')
      offer = Offer.new
      offer.merchant_id = merchant.id
      offer.title = CJ::XmlParser.get_value(node, 'link-name')
      offer.url = CJ::XmlParser.get_value(node, 'destination')
      offer.description = CJ::XmlParser.get_value(node, 'description')
      offer.expires_at = CJ::XmlParser.get_value(node, 'promotion-end-date')
      offers << offer
    end
    offers
  end
end