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
    @message.sender_show = current_user.username
    @message.receiver_show = @message[:receiver_name]

    if User.find_by(username: @message[:receiver_name]) != nil
      flash[:success] = "Message send"
      @message.save
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Can't find username #{@message[:receiver_name]}"
      redirect_back(fallback_location: root_path)
    end
  end

  def notshowsendmessage
    @message = Message.find_by_id(params[:id])
    @message.update_attributes(:sender_show => nil)
    redirect_back(fallback_location: root_path)
  end

  def notshowreceivemessage
    @message = Message.find_by_id(params[:id])
    @message.update_attributes(:receiver_show => nil)
    redirect_back(fallback_location: root_path)
  end

  private

  def messageParams
    params.require(:message).permit(:content, :receiver_name)
  end
end
