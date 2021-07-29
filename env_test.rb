require 'bundler/setup'
require 'minitest/autorun'

class EnvTest < Minitest::Test
  def test_ruby
    assert(RUBY_VERSION >= '3.0.0')
  end

  def test_docker
    refute_empty(`which docker-compose`)
  end
end
