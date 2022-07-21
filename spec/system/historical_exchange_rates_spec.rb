require 'rails_helper'

RSpec.describe "Searching of Historical Exchange Rate", type: :system do 
  let(:params) { { base: 'USD', date:'2022-06-08', symbols: %w[PHP AUD] } }
  let(:historical_rates_response) { CurrencyScoop::HistoricalExchangeRateRequester.call(params[:base], params[:date], params[:symbols].join(',')) }

  context 'when user selects specific currency codes' do
    it 'searches rates of selected currency codes', vcr: { cassette_name: 'historical_rates' } do
      visit new_historical_exchange_rate_path
      select params[:base], from: 'historical_exchange_rate[base]'
      select params[:symbols][0], from: 'historical_exchange_rate[symbols][]'
      select params[:symbols][1], from: 'historical_exchange_rate[symbols][]'
      fill_in 'historical_exchange_rate[date]', with: params[:date]

      click_on 'See Historical Exchange Rate'

      historical_rates_response.rates.each_pair do |currency_code, currency_value|
        expect(page).to have_text(currency_code)
        expect(page).to have_text(currency_value)
      end
    end
  end    
end
