class PayloadStats
  attr_reader :last_5_days
  def initialize
    @last_5_days = last_5_days_formatted
  end

  def top_urls
    last_5_days.reduce({}) do |hash, (date, payloads)|
      hash[date] = payloads.group_by {|p| p.url}
                           .map {|url, v| {"url" => url, "visits" => v.size}}
                           .sort_by { |e| e.values.last }.reverse; hash
    end
  end

  def top_referrers
    last_5_days.reduce({}) do |date_hash, (date, payloads)|
      date_hash.merge(date => array_url_stats(date, payloads))
    end
  end

  private

  def last_5_days_formatted
    Payload.last_5_days.group_by {|p| p.created_at.to_date }.sort.reverse
  end
  
  def array_url_stats(date, payloads)
    unsorted_url_array(date, payloads).sort_by{|h| h.values[1]}.reverse
  end

  def unsorted_url_array(date, payloads)
    payloads.group_by(&:url).reduce([]) do |url_array, (url, url_values)|
      url_array << {"url"       => url,
                    "visits"    => url_values.size,
                    "referrers" => referrer_array(url, url_values) }
    end
  end

  def referrer_array(url, url_vals)
    unsorted_ref_array(url, url_vals).sort_by{|h| h.values[1]}.reverse
  end

  def unsorted_ref_array(url, url_vals)
    url_vals.group_by(&:referrer)
            .reduce([]) {|refs, (ref, ref_vals)| add_ref(refs, ref, ref_vals) }
  end

  def add_ref(refs, ref, ref_vals)
    refs << {"url" => ref, "visists" => ref_vals.size } if ref.present?
    refs
  end
end
