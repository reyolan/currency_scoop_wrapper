module CurrencyScoop
  class CurrenciesRequester < ApplicationService
    def initialize(currency_type)
      @currency_type = currency_type
    end

    def call
      request_currencies
    end

    private

    def request_currencies
      client = CurrencyScoop::Api::Client.new
      currencies = Rails.cache.fetch('currencies', expires_in: 1.hour) { client.currencies(@currency_type)['response'] }
      currencies.to_struct
    end
  end
end

