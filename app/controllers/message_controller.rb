class MessageController < ApplicationController
  def index
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @messages = Message.all
  end

  def new
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @message = Message.new
  end

  def create
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @message = current_user.messages.new(messageParams)
    @message.sender_name = current_user.username

    if User.find_by(username: @message[:receiver_name]) != nil
      @message.save
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Can't find username #{@message[:receiver_name]}"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def messageParams
    params.require(:message).permit(:content, :receiver_name)
  end
end
