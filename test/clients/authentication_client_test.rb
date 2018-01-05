require 'test_helper'
require 'securerandom'

class AuthenticationClientTest < BaseClientTest
  setup do
    @client = Shanon::Clients::AuthenticationClient.new

    @dummy_token = SecureRandom.hex(10)
    response_body = %(
      <?xml version="1.0" encoding="UTF-8"?>
      <Response xmlns="http://smartseminar.jp/" version="1.53">
        <Token>#{@dummy_token}</Token>
      </Response>
    )
    stub_request(:get, 'https://aaaa-bbbb.smktg.jp/services/rest/authentication?api_key=aaaa&api_sig=d639fb4bda55afd8101a2708cb1303a9de490c87&password=bbbb')
      .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.13.1'})
      .to_return(status: 200, body: response_body, headers: {})
  end

  test 'should return token' do
    assert_equal @dummy_token, @client.get
  end
end
