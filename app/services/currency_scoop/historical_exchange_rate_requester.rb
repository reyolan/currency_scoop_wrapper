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
      exchange_rate = client.historical_exchange_rate(base_currency: @base_currency, date: @date, symbols: @symbols)['response']
      Struct.new(*exchange_rate.keys.map(&:to_sym)).new(*exchange_rate.values)
    end
  end
end
