uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://redistogo:5d5002dfa8f1ba45355eaf10bed55a87@dab.redistogo.com:9132")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)