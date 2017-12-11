class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to '/'
    else
      flash[:error] = "Incorrect Username or Password."
      redirect_to login_path
    end
  end

  def destroy
      logout
      flash[:notice] = "Successfully logged out."
      redirect_to root_path
  end
end
