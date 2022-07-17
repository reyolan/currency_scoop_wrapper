module CurrencyScoop
  module Api
    class Client
      BASE_URL = 'https://newton.now.sh/api/v2'.freeze
      AUTHENTICATION = "?api_key=#{Rails.application.credentials.currency_scope_token}".freeze

      def currency_rates(base_currency)
        send_request("/latest#{AUTHENTICATION}&base=#{base_currency}")
      end

      def specific_currency_rates(base_currency:, specific_currencies:)
        # %2C is comma
        # specific_currencies should be an array separated by comma?
        send_request("/latest#{AUTHENTICATION}&base=#{base_currency}&symbols=#{specific_currencies}")
      end

      def supported_currencies(currency_type)
        send_request("/currencies&type=#{currency_type}")
      end

      def convert_currency(from:, to:, amount:)
        send_request("/convert?from=#{from}&to=#{to}&amount=#{amount}")
      end

      private

      def send_request(path_to_resource)
        connection = Faraday.new(url: BASE_URL)
        response = connection.get(path_to_resource)
        JSON.parse(response.body)
      end
    end
  end
end
