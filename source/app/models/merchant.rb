class Merchant
  attr_accessor :id, :name

  def persist!
    MerchantRepository.create!(:id => id, :name => name)
  end
end