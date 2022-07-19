class CurrenciesController < ApplicationController
  def index
    @currencies = CurrencyScoop::CurrenciesRequester.call('fiat').fiats
  end
end
