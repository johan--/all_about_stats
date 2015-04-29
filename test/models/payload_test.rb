require 'test_helper'

class PayloadTest < ActiveSupport::TestCase
  attr_reader :payload

  def setup
    @payload = Payload.new(valid_attributes)
  end

  def valid_attributes
    { url: "http://apple.com",
      referrer: "http://store.apple.com/us",
      created_at: Time.parse('2015-04-28') }
  end
  
  def payload_hash
    Digest::MD5.hexdigest(payload_string)
  end

  def payload_string
    output = "{id:#{payload.id}, url: '#{payload.url}', "
    output += "referrer: '#{payload.referrer}', " if payload.referrer.present?
    output += "created_at: '#{payload.created_at}'}"
  end

  test "it creates a payload with a referrer" do
     payload.save

     assert payload.valid?
     assert_equal "http://apple.com",           payload.url
     assert_equal "http://store.apple.com/us",  payload.referrer
     assert_equal Time.parse('2015-04-28'),     payload.created_at
     assert_equal payload_hash,                 payload.payload_hash
  end

  test "it can create a payload without a referrer" do
     payload.referrer = nil
     payload.save

     assert payload.valid?
     assert_equal "http://apple.com",        payload.url
     assert_equal nil,                       payload.referrer
     assert_equal Time.parse('2015-04-28'),  payload.created_at
     assert_equal payload_hash,              payload.payload_hash
  end

  test "it can not create a payload without a url" do
     payload.url = nil
     assert payload.invalid?
  end
end
