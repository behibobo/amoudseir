class ServiceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notify_#{params[:push_token]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
