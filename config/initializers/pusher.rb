require 'pusher'

pusher = Pusher::Client.new(
  app_id: "735558",
  key: "2a0e191a544c745780f0",
  secret: "7fa58d449883d3e9c3bc",
  cluster: "ap2",
  use_tls: true
)