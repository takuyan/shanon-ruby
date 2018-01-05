require 'digest/sha1'
require 'openssl'

module Shanon
  class AbstractClient
    attr_reader :secrets, :conn, :token

    def initialize
      @secrets = get_secrets
      @conn = build_client
      @token = get_token
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

    def get_token
      # override by Authenticatable
    end

    def params_with_signature(opts={})
      seeds = { api_key: secrets[:api_key] }.merge!(opts)
      seeds.merge!(token: token) if token

      base = seeds.sort.reduce('') do |s, (k, v)|
        s.concat %(#{k}#{v})
      end

      seeds.merge!({ api_sig: get_signature(base) })
    end

    def get_signature(base)
      ::OpenSSL::HMAC.hexdigest('sha1', secrets[:secret_key], base)
    end
  end
end
