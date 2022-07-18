class CurrencyRatesController < ApplicationController
  def index
    @currency_rates = CurrencyScoop::CurrencyRatesRequester.call(params[:base])
  end

  def show
    @currency_rate = CurrencyScoop::SpecificCurrencyRatesRequester.call(params[:base], params[:symbols])
  end
end
