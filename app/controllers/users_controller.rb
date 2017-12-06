class UsersController < ApplicationController
  def index
    @users = User.all
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
    if (current_user != @user)
      flash[:error] = 'Stop Hacking!'
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end