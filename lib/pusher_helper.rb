require 'pusher'

class PusherHelper
	class << self
		def get_object()
			pusher = Pusher::Client.new(
				app_id: ENV["pusher_app_id"],
				key: ENV["pusher_key"],
				secret: ENV["pusher_secret"],
				cluster: ENV["puhser_cluster"],
				use_tls: true
			)
			pusher
		end
	end
end