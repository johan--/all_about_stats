require 'test_helper'

class PayloadTest < ActiveSupport::TestCase
  attr_reader :ps

  def setup
    @ps = PayloadStats.new
  end

  test "can produce top urls" do
    top_urls = ps.top_urls
    value = top_urls[top_urls.keys[0]][0]

    assert_equal Date,               top_urls.keys[0].class
    assert_equal "http://apple.com", value["url"]
    assert_equal 2,                  value["visits"]
  end

  test "it can produce top referrers" do
    top_referrers = ps.top_referrers
    value = top_referrers[top_referrers.keys[0]][0]

    assert_equal Date,               top_referrers.keys[0].class
    assert_equal "http://apple.com", value["url"]
    assert_equal 2,                  value["visits"]
    assert_equal 1,                  value["referrers"].size
  end
end
