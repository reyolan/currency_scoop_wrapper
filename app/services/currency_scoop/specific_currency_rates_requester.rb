module CurrencyScoop
  class SpecificCurrencyRatesRequester < ApplicationService
    def initialize(base_currency:, symbols:)
      @base_currency = base_currency
      @symbols = symbols
    end

    def call
      request_specific_currency_rates
    end

    private

    def request_specific_currency_rates
      client = CurrencyScoop::Api::Client.new
      client.specific_currency_rates(base_currency: @base_currency, symbols: @symbols)
    end
  end
end
