module Shanon
  # Configures global settings for Shanon
  #   Shanon.configure do |config|
  #     config.api_key    = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
  #     config.fqdn       = 'aaaa-bbbb.smktg.jp'
  #     config.password   = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
  #     config.secret_key = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
  #   end
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :api_key, :fqdn, :password, :secret_key
    attr_writer :param_name

    def initialize
      @api_key    = nil
      @fqdn       = nil
      @password   = nil
      @secret_key = nil
    end

    # If param_name was given as a callable object, call it when returning
    def param_name
      @param_name.respond_to?(:call) ? @param_name.call : @param_name
    end
  end
end
