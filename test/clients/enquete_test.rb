require 'test_helper'

class EnqueteClientTest < BaseClientTest
  setup do
    stub_authentication

    response_body = File.new('test/fixtures/enquete/get.xml')
    stub_request(:get, /enquete/)
      .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.13.1'})
      .to_return(status: 200, body: response_body, headers: {})

    @client = Shanon::Clients::EnqueteClient.new
  end

  test 'should return something' do
    # TODO:
    assert @client.get
  end
end
