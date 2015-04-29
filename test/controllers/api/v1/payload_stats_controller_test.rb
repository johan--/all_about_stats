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
end
