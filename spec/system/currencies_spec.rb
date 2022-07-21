require 'rails_helper'

RSpec.describe "Currencies", type: :system do
  let(:currencies_response) { CurrencyScoop::CurrenciesRequester.call('fiat') }

  it 'shows all currencies', vcr: { cassette_name: 'currencies' } do
    visit currencies_path

    currencies_response.fiats.members.each do |c_members|
      expect(page).to have_text(c_members)
    end
  end
end
