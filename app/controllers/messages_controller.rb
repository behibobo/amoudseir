require 'pusher'


class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.where(to: current_user)
    @total_records = @messages.count
    unread = Message.where(to: current_user).where(status: :unread).count
    @messages = @messages.paginate(page: params[:page], per_page: params[:page_size])
    render json: {data: ActiveModelSerializers::SerializableResource.new(@messages), total_records: @total_records, unread: unread }
  end

  # GET /messages/1
  def show
    @message.update(status: :seen)
    render json: @message
  end

  # POST /messages
  def create
    byebug

    pusher = PusherHelper::get_object
    
    users = User.all
    if message_params[:message_type] == 1
      users = users.where(role: :customer)
    elsif message_params[:message_type] == 2
      users = users.where(role: :technician)
    end

    users.each do |user|
      @message = Message.new(message_params)
      @message.to = user

      if @message.save
        notification = {
          title: @message.title,
          body: @message.body,
          icon: nil
        }
        user_id = current_user.id.to_s
        pusher.trigger(user_id, 'event', message: notification)

    end

    end

    render json: [], status: :created

  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:body, :title, :to, :message_type)
    end
end
