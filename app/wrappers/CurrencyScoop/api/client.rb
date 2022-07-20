module CurrencyScoop
  module Api
    class Client
      BASE_URL = 'https://api.currencyscoop.com/v1/'.freeze
      ENCODED_COMMA = '%2C'.freeze
      TOKEN = Rails.application.credentials.currency_scoop_token

      def currency_rates(base_currency:, symbols:)
        symbols = symbols.present? ? symbols * ENCODED_COMMA : ''
        send_request(path_to_resource: 'latest', params: { base: base_currency, symbols: })
      end

      def currencies(currency_type)
        send_request(path_to_resource: 'currencies', params: { type: currency_type })
      end

      def convert_currency(from_currency_code:, to_currency_code:, amount:)
        send_request(path_to_resource: 'convert', params: { from: from_currency_code, to: to_currency_code, amount: })
      end

      def historical_exchange_rate(base_currency:, date:, symbols:)
        send_request(path_to_resource: 'historical', params: { base: base_currency, date:, symbols: symbols * ENCODED_COMMA })
      end

      private

      def send_request(path_to_resource:, params: {})
        connection = Faraday.new(url: BASE_URL, params: { api_key: TOKEN }.merge(params)) do |f|
          f.response :json
        end
        response = connection.get(path_to_resource)
        response.body
      end
    end
  end
end
