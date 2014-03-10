require 'spec_helper'

describe 'offers page' do
  it 'should show offers' do
    visit '/offers'
    click_button 'Crawl!'

    expect(page).to have_content 'new offers created!'
    expect(page).to have_content 'Offers'
    page.find('.offers').all('.offer').count.should be > 10

    # after refresh
    visit '/offers'
    expect(page).to have_content 'Offers'
    page.find('.offers').all('.offer').count.should be > 10
  end
end