class Payload < ActiveRecord::Base
  validates :url,  presence: true

  after_create :generate_payload_hash

  def self.last_5_days
    where("created_at >= ?", 5.days.ago).group_by {|payload| payload.created_at.to_date }
  end

  def self.top_urls
    last_5_days.sort.reverse.reduce({}) do |hash, (date, payloads)|
      hash[date] = payloads.group_by {|p| p.url}
                           .map {|url, v| {"url" => url, "visits" => v.size}}
                           .sort_by { |e| e.values.last }.reverse; hash
    end
  end

  def generate_payload_hash
    update_attributes(payload_hash: Digest::MD5.hexdigest(payload_string))
  end

  def payload_string
    output  = "{id:#{id}, url: '#{url}', "
    output += "referrer: '#{referrer}', " if referrer.present?
    output += "created_at: '#{created_at}'}"
  end
end
