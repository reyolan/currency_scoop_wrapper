module CurrencyScoop
  class CurrencyRatesRequester < ApplicationService
    def initialize(base_currency)
      @base_currency = base_currency
    end

    def call
      request_currency_rates
    end

    private

    def request_currency_rates
      client = CurrencyScoop::Api::Client.new
      client.currency_rates(@base_currency)
    end
  end
end
