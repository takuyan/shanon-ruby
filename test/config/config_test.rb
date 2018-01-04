require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  sub_test_case 'api_key' do
    test 'by default' do
      assert_nil Shanon.config.api_key
    end

    test 'configured via config block' do
      begin
        Shanon.configure {|c| c.api_key = 'abcde'}
        assert_equal 'abcde', Shanon.config.api_key
      ensure
        Shanon.configure {|c| c.api_key = nil}
      end
    end
  end

  sub_test_case 'fqdn' do
    test 'by default' do
      assert_nil Shanon.config.fqdn
    end

    test 'configured via config block' do
      begin
        Shanon.configure {|c| c.fqdn = 'aaaa-bbbb.smktg.jp'}
        assert_equal 'aaaa-bbbb.smktg.jp', Shanon.config.fqdn
      ensure
        Shanon.configure {|c| c.fqdn = nil}
      end
    end
  end

  sub_test_case 'password' do
    test 'by default' do
      assert_nil Shanon.config.password
    end

    test 'configured via config block' do
      begin
        Shanon.configure {|c| c.password = 'abcde'}
        assert_equal 'abcde', Shanon.config.password
      ensure
        Shanon.configure {|c| c.password = nil}
      end
    end
  end

  sub_test_case 'secret_key' do
    test 'by default' do
      assert_nil Shanon.config.secret_key
    end

    test 'configured via config block' do
      begin
        Shanon.configure {|c| c.secret_key = 'abcde'}
        assert_equal 'abcde', Shanon.config.secret_key
      ensure
        Shanon.configure {|c| c.secret_key = nil}
      end
    end
  end
end
