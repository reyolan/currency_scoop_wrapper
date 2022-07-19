class SpecificCurrencyRatesController < ApplicationController
  def index
    @currency_rate = CurrencyScoop::SpecificCurrencyRatesRequester.call(params[:base], params[:symbols])
  end
end
