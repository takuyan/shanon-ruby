require 'shanon/version'

require 'shanon/config'
require 'shanon/abstract_client'
require 'shanon/authenticatable'

# clients
Dir[File.join(File.dirname(__FILE__), 'shanon/clients/*_client.rb')].each {|f| require f }

module Shanon
  # Your code goes here...
end
