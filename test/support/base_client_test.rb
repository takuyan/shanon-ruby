class BaseClientTest < Test::Unit::TestCase
  setup do
    Shanon.configure do |config|
      config.api_key    = 'aaaa'
      config.fqdn       = 'aaaa-bbbb.smktg.jp'
      config.password   = 'bbbb'
      config.secret_key = 'cccc'
    end
  end

  teardown do
    Shanon.configure do |config|
      config.api_key    = nil
      config.fqdn       = nil
      config.password   = nil
      config.secret_key = nil
    end
  end
end
