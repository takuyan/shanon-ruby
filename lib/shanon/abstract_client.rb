require 'digest/sha1'
require 'openssl'

module Shanon
  class AbstractClient
    attr_reader :secrets, :conn

    def initialize
      @secrets = get_secrets
      @conn = build_client
    end

    private

    def get_secrets
      {
        api_key: Shanon.config.api_key,
        fqdn: Shanon.config.fqdn,
        password: Shanon.config.password,
        secret_key: Shanon.config.secret_key
      }
    end

    def build_client
      fqdn = secrets[:fqdn]
      host = %(https://#{fqdn})

      ::Faraday.new(url: host) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use Faraday::Adapter::NetHttp
      end
    end
  end
end
