module CurrencyScoop
  class HistoricalExchangeRateRequester < ApplicationService
    def initialize(base_currency, date, symbols)
      @base_currency = base_currency
      @date = date
      @symbols = symbols
    end

    def call
      request_historical_exchange_rate
    end

    private

    def request_historical_exchange_rate
      client = CurrencyScoop::Api::Client.new
      client.specific_currency_rates(base_currency: @base_currency, date: @date, symbols: @symbols)
    end
  end
end
