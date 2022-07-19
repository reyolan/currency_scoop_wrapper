module CurrencyScoop
  class CurrencyRatesRequester < ApplicationService
    def initialize(base_currency, symbols)
      @base_currency = base_currency
      @symbols = symbols
    end

    def call
      request_currency_rates
    end

    private

    def request_currency_rates
      client = CurrencyScoop::Api::Client.new
      currency_rates = client.currency_rates(base_currency: @base_currency, symbols: @symbols)['response']
      Struct.new(*currency_rates.keys.map(&:to_sym)).new(*currency_rates.values)
    end
  end
end
