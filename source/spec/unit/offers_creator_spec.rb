require 'spec_helper'

describe 'OffersCreator' do
  it 'should create 20 new objects' do
    xml = File.open("lib/assets/output.xml")
    offers = OffersCreator.proceed!(xml)
    offers.size.should eql(20)
    Offer.all.size.should eql(20)
  end

  it 'should not create duplicates' do
    xml = File.open("lib/assets/output.xml")
    offers = OffersCreator.proceed!(xml)
    offers = OffersCreator.proceed!(xml)
    offers.size.should eql(0)
    Offer.all.size.should eql(20)
  end
end