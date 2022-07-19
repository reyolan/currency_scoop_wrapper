class CurrencyRatesController < ApplicationController
  def index
    @currency_rates_data = CurrencyScoop::CurrencyRatesRequester.call(params[:base])
  end

  def create
    redirect_to currency_rates_url(base: params[:base])
  end
end
