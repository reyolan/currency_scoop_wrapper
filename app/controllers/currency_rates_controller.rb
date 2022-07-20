class CurrencyRatesController < ApplicationController
  def index
    @currency_rates_data = CurrencyScoop::CurrencyRatesRequester.call(params[:base], params[:symbols])
    @currency_codes = CurrencyScoop::CurrenciesRequester.call('fiat').fiats.members
  end

  def create
    redirect_to currency_rates_url(currency_rate_params)
  end

  private

  def currency_rate_params
    params.require(:currency_rate).permit(:base, symbols: []).tap do |param|
      param[:symbols].reject!(&:blank?)
    end
  end
end
