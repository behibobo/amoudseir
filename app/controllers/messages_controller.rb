class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all
    if current_user.role == "customer"
	    @messages = @messages.where(to: current_user).or(Message.where(message_type: 'customer')).or(Message.where(message_type: 'everyone'))

    elsif current_user.role == "technician"
	    @messages = @messages.where(to: current_user).or(Message.where(message_type: 'technician')).or(Message.where(message_type: 'everyone'))
    end
    @total_records = @messages.count
    ids = @messages.pluck(:id)
    seen = MessageStatus.where(user: current_user).where(message_id: ids).where(status: :seen).count
    @messages = @messages.paginate(page: params[:page], per_page: params[:page_size])
    render json: {data: ActiveModelSerializers::SerializableResource.new(@messages), total_records: @total_records, unread: @messages.size - seen }
  end

  # GET /messages/1
  def show
    @message.message_status.update(status: 1)
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      notification = {
        title: @message.title,
        body: @message.body,
        icon: nil
      }
      user_id = current_user.id.to_s
      ActionCable.server.broadcast("notify_"+user_id,  message: notification)

      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
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
