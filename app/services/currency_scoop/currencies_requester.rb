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
      currencies = client.currencies(@currency_type)['response']["#{@currency_type}s"]
      Struct.new(*currencies.keys.map(&:to_sym)).new(*currencies.values)
    end
  end
end
