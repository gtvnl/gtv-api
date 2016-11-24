class Rack::Attack

  # `Rack::Attack` is configured to use the `Rails.cache` value by default,
  # but you can override that by setting the `Rack::Attack.cache.store` value
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  allowed = %w[ 127.0.0.1 ::1 192.168.10.158 192.168.10.147 ].to_set

  # Allow all local traffic
  safelist('allow-localhost') do |req|
    !allowed.include?(req.ip)
  end

  # # Only allow local traffic
  # blocklist("only allow localhost") do |req|
  #   req.ip != '127.0.0.1'
  # end

  # Allow an IP address to make 5 requests every 5 seconds
  throttle('req/ip', limit: 5, period: 5) do |req|
    req.ip
  end

  # Send the following response to throttled clients
  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{error: "Throttle limit reached. Retry later."}.to_json]
    ]
  }
end
