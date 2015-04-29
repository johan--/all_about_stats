class Payload < ActiveRecord::Base
  validates :url,  presence: true

  after_create :generate_payload_hash

  def generate_payload_hash
    update_attributes(payload_hash: Digest::MD5.hexdigest(payload_string))
  end

  def payload_string
    output  = "{id:#{id}, url: '#{url}', "
    output += "referrer: '#{referrer}', " if referrer.present?
    output += "created_at: '#{created_at}'}"
  end
end
