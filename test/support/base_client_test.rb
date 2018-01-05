class BaseClientTest < Test::Unit::TestCase
  def stub_authentication
    @dummy_token = SecureRandom.hex(10)
    response_body = %(
      <?xml version="1.0" encoding="UTF-8"?>
      <Response xmlns="http://smartseminar.jp/" version="1.53">
        <Token>#{@dummy_token}</Token>
      </Response>
    )
    stub_request(:get, /authentication/)
      .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.13.1'})
      .to_return(status: 200, body: response_body, headers: {})
  end

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
