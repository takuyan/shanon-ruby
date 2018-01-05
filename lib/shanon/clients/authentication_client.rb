module Shanon
  module Clients
    class AuthenticationClient < Shanon::AbstractClient
      PATH = '/services/rest/authentication'.freeze

      def get
        params = params_with_signature(password: secrets[:password])
        response = conn.get(PATH, params)
        parse(response.body)
      end

      private

      def params_with_signature(opts={})
        seeds = { api_key: secrets[:api_key] }.merge!(opts)

        base = seeds.sort.reduce('') do |s, (k, v)|
          s.concat %(#{k}#{v})
        end

        seeds.merge!({ api_sig: get_signature(base) })
      end

      def get_signature(base)
        ::OpenSSL::HMAC.hexdigest('sha1', secrets[:secret_key], base)
      end

      def parse(xml)
        ::Ox.parse(xml).Response.Token.text
      end
    end
  end
end
