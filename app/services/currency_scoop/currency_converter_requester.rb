module CurrencyScoop
  class CurrencyConverterRequester < ApplicationService
    def initialize(from_currency_code:, to_currency_code:, amount:)
      @from_currency_code = from_currency_code
      @to_currency_code = to_currency_code
      @amount = amount
    end

    def call
      request_currencies
    end

    private

    def convert_currency
      client = CurrencyScoop::Api::Client.new
      client.convert_currency(from_currency_code: @from_currency_code, to_currency_code: @to_currency_code,
                              amount: @amount)
    end
  end
end
