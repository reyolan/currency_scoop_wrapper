class HistoricalExchangeRateController < ApplicationController
  def show
    @historical_exchange_rate = CurrencyScoop::HistoricalExchangeRateRequester.call(base_currency: params[:base],
                                                                                    date: params[:date],
                                                                                    symbols: params[:symbols])
  end
end
