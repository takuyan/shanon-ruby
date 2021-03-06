module Shanon
  module Clients
    # http://apidoc.shanon.co.jp/ja/api/visitor/enquete/get.html
    class EnqueteClient < Shanon::AbstractClient
      include Authenticatable

      PATH = '/services/rest/visitor/enquete'.freeze

      def get(opts={})
        params = params_with_signature(opts)
        response = conn.get PATH, params
        response.body
      end
    end
  end
end
