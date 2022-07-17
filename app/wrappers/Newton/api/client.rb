module Github
  module Api
    class Client
      BASE_URL = 'https://newton.now.sh/api/v2'.freeze

      def simplify_function(function)
        send_request("/simplify/#{function}")
      end

      def factor_function(function)
        send_request("/factor/#{function}")
      end

      def differentiate_function(function)
        send_request("/derive/#{function}")
      end

      def integrate_function(function)
        send_request("/integrate/#{function}")
      end

      def find_zeroes(function)
        send_request("/zeroes/#{function}")
      end

      def area_under_the_curve(upper_boundary:, lower_boundary:, function:)
        send_request("/area/#{lower_boundary}:#{upper_boundary}l#{function}")
      end

      def cosine_of(value)
        send_request("/cos/#{value}")
      end

      def sine_of(value)
        send_request("/sine/#{value}")
      end

      def tangent_of(value)
        send_request("/sine/#{value}")
      end

      def inverse_sine_of(value)
        send_request("/arcsin/#{value}")
      end

      def inverse_cosine_of(value)
        send_request("/arccos/#{value}")
      end

      def inverse_tangent_of(value)
        send_request("/arctan/#{value}")
      end

      def absolute_value_of(value)
        send_request("abs/#{value}")
      end

      def logarithm_of(base:, argument:)
        send_request("log/#{base}l#{argument}")
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
