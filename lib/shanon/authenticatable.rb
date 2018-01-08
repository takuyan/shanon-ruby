module Shanon
  module Authenticatable
    def get_token
      xml = Shanon::Clients::AuthenticationClient.new.get
      @token = ::Ox.parse(xml).Response.Token.text
    end
  end
end
