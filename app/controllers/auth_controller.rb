class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login]

    def login
      authenticate params[:username], params[:password]
    end

    private
    def authenticate(username, password)
      user = User.find_by(username: username)
      command = AuthenticateUser.call(username, password)

      if command.success?
        render json: {
          token: command.result,
          role: User.roles[user.role],
          status: 0,
          open_services: user.services.where(status: :open).size,
          unread_messages: Message.joins([:message_status, :to]).where(:users => {id: user.id}).where(:message_statuses => {status: :unread}).size
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
     end
  end
