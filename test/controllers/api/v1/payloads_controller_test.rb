require "test_helper"

class Api::V1::PayloadsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    payloads = JSON.parse(response.body)["payloads"]
    first_payload = payloads.first

    assert_response :success
    assert_equal 2,                           payloads.count
    assert_equal "http://apple.com",          first_payload["url"]
    assert_equal "http://store.apple.com/us", first_payload["referrer"]
  end

  test "#show" do
    get :show, format: :json, id: Payload.first.id

    payload = JSON.parse(response.body)["payload"]

    assert_response :success
    assert_equal "http://apple.com",          payload["url"]
    assert_equal "http://store.apple.com/us", payload["referrer"]
  end
end
