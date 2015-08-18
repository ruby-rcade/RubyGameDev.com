RubyStackoverflow.configure do|config|
  config.client_key = ENV["STACKEXCHANGE_CLIENT_KEY"]
  config.access_token = ENV["ACCESS_TOKEN"]
end
