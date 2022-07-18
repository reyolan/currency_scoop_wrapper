class CurrenciesController < ApplicationController
  def index
    @fiat_currencies = CurrencyScoop::CurrenciesRequester.call('fiat')
  end
end
