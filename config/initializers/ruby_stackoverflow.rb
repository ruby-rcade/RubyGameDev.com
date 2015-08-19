RubyStackoverflow.configure do|config|
  config.client_key = ENV["STACKEXCHANGE_CLIENT_KEY"]
  config.access_token = ENV["STACKEXCHANGE_ACCESS_TOKEN"]
end
