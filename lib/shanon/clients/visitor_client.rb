module Shanon
  module Clients
    class VisitorClient < Shanon::AbstractClient
      include Authenticatable

      PATH = '/services/rest/visitor'.freeze

      # opts = {
      #   search_key1: 'DateRegist',
      #   search_operator1: 'lt',
      #   search_value1: '2018-01-01T00:00:00+09:00'
      # }
      def get(opts={})
        params = params_with_signature(opts)
        response = conn.get PATH, params
        parse(response.body)
      end

      private

      def parse(xml)
        ::Ox.parse(xml)
      end
    end
  end
end
