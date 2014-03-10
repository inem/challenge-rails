class OffersCreator
  def self.proceed!(xml)
    offers = []
    CJ::XmlParser.new(xml) do |node|
      merchant_api_id = CJ::XmlParser.get_value(node, 'advertiser-id')
      merchant = Merchant.find_by_api_id(merchant_api_id)
      unless merchant
        merchant = Merchant.new
        merchant.api_id = merchant_api_id
        merchant.name   = CJ::XmlParser.get_value(node, 'advertiser-name')
        merchant.save!
      end

      offer_api_id = CJ::XmlParser.get_value(node, 'link-id')
      offer = Offer.find_by_api_id(offer_api_id)
      unless offer
        offer = Offer.new
        offer.merchant    = merchant
        offer.api_id      = offer_api_id
        offer.title       = CJ::XmlParser.get_value(node, 'link-name')
        offer.url         = CJ::XmlParser.get_value(node, 'destination')
        offer.description = CJ::XmlParser.get_value(node, 'description')
        offer.expires_at  = CJ::XmlParser.get_value(node, 'promotion-end-date')
        offer.save!
        offers << offer
      end
    end
    offers
  end
end