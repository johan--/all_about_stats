class Seed
  def initialize
     generate_payloads
  end

  def urls
    ["http://apple.com",
     "https://apple.com",
     "https://www.apple.com",
     "http://developer.apple.com"
      ]
  end

  def referrers
    ["http://apple.com",
    "https://apple.com",
    "https://www.apple.com",
    "http://developer.apple.com",
    "http://en.wikipedia.org",
    "http://opensource.org",
     nil]
  end

  def generate_payloads
    1000.times do |i|
      payload = Payload.create(
      url:       urls.shuffle.first,
      referrer:  referrers.shuffle.first,
      created_at: (DateTime.now() - rand(11))
      )
      puts "Payload ##{payload.id} created"
    end
  end
end

Seed.new
