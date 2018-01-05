require 'test_helper'
require 'securerandom'

class AuthenticationClientTest < BaseClientTest
  setup do
    stub_authentication

    @client = Shanon::Clients::AuthenticationClient.new
  end

  test 'should return token' do
    assert_equal @dummy_token, @client.get
  end
end
