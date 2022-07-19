class HistoricalExchangeRateController < ApplicationController
  def new
    @currency_codes = CurrencyScoop::CurrenciesRequester.call('fiat').fiats.keys
  end

  def create
    redirect_to historical_exchange_rate_url(historical_exchange_rate_params)
  end

  def show
    @historical_exchange_data = CurrencyScoop::HistoricalExchangeRateRequester.call(params[:base], params[:date],
                                                                                    params[:symbols])
  end

  private

  def historical_exchange_rate_params
    params.require(:historical_exchange_rate).permit(:base, :date, symbols: [])
  end
end
