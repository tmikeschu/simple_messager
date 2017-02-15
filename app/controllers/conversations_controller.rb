class ConversationsController < ApplicationController
  def new
    @users = User.where.not(id: current_user.id)
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(user_id: current_user.id)
    if @conversation.save
      @conversation.add_members(current_user, conversation_params.to_h)
      redirect_to conversation_path(@conversation)
    else
      flash[:danger] = @conversation.errors.full_messages.join(", ")
      render new_conversation_path
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  private
    def conversation_params
      params.require(:conversation).permit(members: [])
    end
end
