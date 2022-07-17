module CurrencyScoop
  module Api
    class Client
      BASE_URL = 'https://newton.now.sh/api/v2'.freeze
      AUTHENTICATION = "api_key=#{Rails.application.credentials.currency_scope_token}".freeze

      def currency_rates(base_currency:)
        send_request("/latest?#{AUTHENTICATION}&base=#{base_currency}")
      end

      def specific_currency_rates(base_currency:, symbols:)
        # %2C is comma
        # symbols should be an array separated by comma?
        send_request("/latest?#{AUTHENTICATION}&base=#{base_currency}&symbols=#{symbols}")
      end

      def supported_currencies(currency_type:)
        send_request("/currencies?#{AUTHENTICATION}&type=#{currency_type}")
      end

      def convert_currency(from_currency_code:, to_currency_code:, amount:)
        send_request("/convert?#{AUTHENTICATION}from=#{from_currency_code}&to=#{to_currency_code}&amount=#{amount}")
      end

      def historical_exchange_rate(base_currency:, date:, symbols:)
        # %2C is comma
        # symbols should be an array separated by comma?
        send_request("/historical?#{AUTHENTICATION}&base=#{base_currency}&date=#{date}&symbols=#{symbols}")
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
