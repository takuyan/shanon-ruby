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

      def parse(xml)
        ::Ox.parse(xml).Response.Token.text
      end
    end
  end
end
