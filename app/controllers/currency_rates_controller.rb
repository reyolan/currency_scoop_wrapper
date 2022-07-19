class CurrencyRatesController < ApplicationController
  def index
    @currency_rates_data = CurrencyScoop::CurrencyRatesRequester.call(params[:base], params[:symbols])
  end

  def create
    redirect_to currency_rates_url(base: currency_rate_params[:base_currency], symbols: currency_rate_params[:symbols])
  end

  private

  def currency_rate_params
    params.require(:currency_rate).permit(:base_currency, :symbols)
  end
end
