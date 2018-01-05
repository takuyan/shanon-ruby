module Shanon
  module Authenticatable
    def get_token
      @token = Shanon::Clients::AuthenticationClient.new.get
    end
  end
end
