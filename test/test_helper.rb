$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'test/unit'
require 'faraday'
require 'ox'
require 'webmock/test_unit'
require 'shanon'

Dir[File.join(File.dirname(__FILE__), 'support/**/**.rb')].each {|f| require f }
