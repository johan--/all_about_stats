require 'test_helper'

class Api::V1::PayloadStatsControllerTest < ActionController::TestCase
  test "#top_urls" do
    get :top_urls, format: :json
    top_urls = JSON.parse(response.body)
    most_recent = top_urls[top_urls.keys.first]
    highest_most_recent = most_recent.first

    assert_response :success
    assert_equal 2,                    most_recent.size
    assert_equal "http://apple.com",   highest_most_recent["url"]
    assert_equal 2,                    highest_most_recent["visits"]
  end

  test "#top_referrers" do
    get :top_referrers, format: :json
    top_referrers = JSON.parse(response.body)
    most_recent = top_referrers[top_referrers.keys.first]
    highest_most_recent = most_recent.first

    assert_response :success
    assert_equal 2,                    most_recent.size
    assert_equal "http://apple.com",   highest_most_recent["url"]
    assert_equal 2,                    highest_most_recent["visits"]
    assert_equal 1,                    highest_most_recent["referrers"].size
  end
end
