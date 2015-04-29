class Payload < ActiveRecord::Base
  attr_reader :payload_string

  validates :url,  presence: true

  after_create :generate_payload_hash

  def generate_payload_hash
    update_attributes(payload_hash: Digest::MD5.hexdigest(payload_string))
  end

  def payload_string
    @payload_string = "{id:#{id}, url: '#{url}', "
    @payload_string += "referrer: '#{referrer}', " if referrer.present?
    @payload_string += "created_at: '#{created_at}'}"
  end
end
