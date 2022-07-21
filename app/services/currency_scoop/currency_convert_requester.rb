module CurrencyScoop
  class CurrencyConvertRequester < ApplicationService
    def initialize(from_currency_code, to_currency_code, amount)
      @from_currency_code = from_currency_code
      @to_currency_code = to_currency_code
      @amount = input_zero_if_empty_string(amount)
    end

    def call
      request_convert_currency
    end

    private

    def input_zero_if_empty_string(amount)
      amount.blank? ? '0' : amount
    end

    def request_convert_currency
      client = CurrencyScoop::Api::Client.new
      conversion_data = client.convert_currency(from_currency_code: @from_currency_code, to_currency_code: @to_currency_code,
                                                amount: @amount)['response']
      conversion_data.to_struct
    end
  end
end
