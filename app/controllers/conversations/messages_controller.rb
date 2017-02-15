class Conversations::MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      flash[:success] = "Message sent!"
      redirect_to conversation_path(@conversation)
    else
      flash[:danger] = @message.errors.full_messages.join(", ")
      render conversation_path(@conversation)
    end
  end

  private

    def message_params
      params.require(:message).permit(:user_id, :body)
    end

    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end
end
