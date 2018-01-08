module Shanon
  module Clients
    class AuthenticationClient < Shanon::AbstractClient
      PATH = '/services/rest/authentication'.freeze

      def get
        params = params_with_signature(password: secrets[:password])
        response = conn.get(PATH, params)
        response.body
      end
    end
  end
end
