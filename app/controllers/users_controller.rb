class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(" ")
      render :new
    end
  end


  def show
    @user = User.find_by_id(params[:id])
    @topics = @user.topics
    @message = Message.new
    # if (current_user != @user)
    #   flash[:error] = 'Stop Hacking!'
    #   redirect_to '/'
    # end
  end

  def showtopics
    @user = User.find_by_id(params[:id])
    @topics = @user.topics
    @message = Message.new
  end

  def showmessage
    @user = User.find_by_id(params[:id])
    @message = Message.new
    @receive_message = Message.where(:receiver_name => "#{@user.username}")
  end

  def showsendmessage
    @user = User.find_by_id(params[:id])
    @message = Message.new
    @send_message = Message.where(:sender_name => "#{@user.username}")
  end

  # def destroymessage
  #   @user = User.find_by_id(params[:id])
  #   @message = Message.find(params[:message_id])
  #   @user.messages.delete(@message)
  # end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
