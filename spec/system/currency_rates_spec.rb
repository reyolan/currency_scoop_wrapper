require 'rails_helper'

RSpec.describe "Searching of Currency Rates", type: :system do
  let(:params) { { base: 'USD', symbols: %w[PHP AUD] } }
  let(:currency_rates_response) { CurrencyScoop::CurrencyRatesRequester.call(params[:base], params[:symbols].join(',')) }
  let(:all_currency_rates_response) { CurrencyScoop::CurrencyRatesRequester.call(params[:base], '') }

  context 'when user selects specific currency codes' do
    it 'searches rates of selected currency codes', vcr: { cassette_name: 'currency_rates' } do
      visit currency_rates_path

      select params[:base], from: 'currency_rate[base]'
      select params[:symbols][0], from: 'currency_rate[symbols][]'
      select params[:symbols][1], from: 'currency_rate[symbols][]'

      click_on 'Search'

      currency_rates_response.rates.each_pair do |currency_code, currency_value|
        expect(page).to have_text(currency_code)
        expect(page).to have_text(currency_value)
      end
    end
  end

  context 'when user does not input currency code' do
    it 'searches rates of all currency codes', vcr: { cassette_name: 'all_currency_rates' } do
      visit currency_rates_path

      select params[:base], from: 'currency_rate[base]'

      click_on 'Search'

      all_currency_rates_response.rates.each_pair do |currency_code, currency_value|
        expect(page).to have_text(currency_code)
        expect(page).to have_text(currency_value)
      end
    end
  end      
end
