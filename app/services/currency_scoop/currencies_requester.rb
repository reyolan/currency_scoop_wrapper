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
      client.currencies(@currency_type)
    end
  end
end
