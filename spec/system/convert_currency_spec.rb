require 'rails_helper'

RSpec.describe "Conversion of Currency", type: :system do
  let(:params) { { from: 'USD', to: 'PHP', amount: '1' } }
  let(:currency_conversion_response) { CurrencyScoop::CurrencyConvertRequester.call(params[:from], params[:to], params[:amount]) }

  context 'when user inputs an amount' do
    it 'results to the desired currency conversion', vcr: { cassette_name: 'convert_with_amount', record: :new_episodes } do
      visit new_convert_currency_path

      select params[:from], from: 'convert_currency[from]'
      select params[:to], from: 'convert_currency[to]'
      fill_in 'convert_currency[amount]', with: params[:amount]

      click_on 'Convert'

      expect(page).to have_text(params[:amount])
      expect(page).to have_text(params[:from])
      expect(page).to have_text(params[:to])
      expect(page).to have_text(currency_conversion_response.value)
    end
  end

  context 'when user fails to input an amount' do
    it 'results to an amount of zero', vcr: { cassette_name: 'convert_without_amount', record: :new_episodes } do
      visit new_convert_currency_path

      select params[:from], from: 'convert_currency[from]'
      select params[:to], from: 'convert_currency[to]'

      click_on 'Convert'

      expect(page).to have_text("0 #{params[:from]}")
      expect(page).to have_text(params[:from])
      expect(page).to have_text(params[:to])
    end
  end
end
